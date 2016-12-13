module ImportData
  require 'nokogiri'

  def self.extended(base)
    models = (ImportData.instance_variable_get(:@models) rescue []) || []
    models << base
    ImportData.instance_variable_set(:@models, models)
  end

  def self.models
    ImportData.instance_variable_get(:@models) rescue []
  end

  def self.parse_xml_file(file_path = "#{Rails.root}/public/products_05_12_2016_06_41_05.xml")
    source_products = []
    doc = Nokogiri::XML(File.open(file_path))
    doc.xpath('//product').each do |el|
      product = {}
      product[:product_id] = el.xpath('product_id').text
      product[:product_name] = el.xpath('product_name').text
      product[:available_amount] = el.xpath('available_amount').text
      product[:product_unit] = el.xpath('product_unit').text
      product[:price_minimal] = el.xpath('price_min').text
      product[:price_group_first] = el.xpath('price_gurt1').text
      product[:price_group_second] = el.xpath('price_gurt2').text
      product[:price] = el.xpath('price_gurt3').text



      source_products << product
    end

    source_products
  end

  def self.import(file_path = "#{Rails.root}/public/products_05_12_2016_06_41_05.xml")


    source_products = ImportData.parse_xml_file(file_path)


    ImportData.models.each do |model|
      model.perform_import(source_products)
    end

  end

  def perform_import(source_products)
    source_product_ids = source_products.map{|p| p[:product_id] }
    found_products = where(one_c_id: source_product_ids)
    found_product_ids = found_products.map{|p| p['one_c_id'] }
    found_products_in_sources = source_products.select{|p| p[:product_id].in?(found_product_ids) }
    # puts "found_product_ids: #{found_product_ids.inspect}"
    #puts "found_products_in_sources: #{found_products_in_sources}"
    found_products.each do |product|

      source_product = found_products_in_sources.select{|p| p[:product_id] == product['one_c_id'] }.first




      h = source_product.keep_if{|k, v| k.to_s.in?(%w(price_minimal price_group_first price_group_second price)) }
      #puts "test ="+h.inspect

      changed = false
      h.each do |k, v|
        if product.send(k) != v
          changed = true
          product.send(:"#{k}=", v)
        end
      end

      if changed
        product.save
      end



    end

    nil
  end
end