# == Schema Information
#
# Table name: catalog_door_exterior_door_variants
#
#  id                     :integer          not null, primary key
#  width                  :integer
#  height                 :integer
#  segment                :string
#  coating_type           :string
#  opening_side           :string
#  exterior_door_color_id :integer
#  one_c_id               :string
#  price                  :string
#  price_minimal          :string
#  price_group_first      :string
#  price_group_second     :string
#  currency               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  full_slug              :string
#  full_name              :string
#  promotion              :boolean
#  new                    :boolean
#  recommended            :boolean
#

# t.integer :width
# t.integer :height
# t.string :segment
# t.string :coating_type
# t.string :opening_side
#
# t.belongs_to :exterior_door_color
#
# t.string :one_c_id
#
# t.string :price
# t.string :price_minimal
# t.string :price_group_first
# t.string :price_group_second
# t.string :currency

# t.string :full_slug
# t.string :fill_name

# t.boolean :promotion
# t.boolean :new
# t.boolean :recommended

class Catalog::Door::ExteriorDoorVariant < ActiveRecord::Base
  attr_accessible *attribute_names

  extend Enumerize

  belongs_to :exterior_door_color, :class_name => 'Catalog::Door::ExteriorDoorColor'
  has_one :exterior_door, class_name: 'Catalog::Door::ExteriorDoor', through: :exterior_door_color

  validates_presence_of :width, :height, :segment, :coating_type, :opening_side

  enumerize :opening_side, in: [:'left', :'right']
  enumerize :coating_type, in: [:'apartment', :'street']

  def color
    exterior_door_color
  end


  def composed_full_name
    # Model Color Width Height Segmentation Coating Side_Opening
    [product_color.product.slug, product_color.slug, width, height, segment, coating_type, opening_side]
  end

  def generate_full_slug
    product_url_fragment = composed_full_name.map{|param| param.to_s.underscore }.join("-")
  end

  def create_full_slug
    self.full_slug = generate_full_slug
  end

  # def generate_full_name
  #   composed_full_name.map{|param| param.to_s.underscore }.join(" ")
  # end
  # def create_full_name
  #   self.full_name = generate_full_name
  # end
  def generate_full_name
    if product_color.nil? || product_color.product.nil?
      return
    end
    params = [product_color.product.title, product_color.name, width, height, segment, coating_type, opening_side]
    params.map{|param| param.to_s.underscore }.join(" ")
  end
  def create_full_name
    self.full_name = generate_full_name
  end


  before_save :create_full_name, :create_full_slug

  def base_url
    "/dashboard/doors/exterior-door/"
  end

  def product_color
    exterior_door_color
  end

  def url
    base_url + generate_full_slug
  end

  def full_name
    generate_full_name
  end

  rails_admin do
    navigation_label 'Каталог'

    label 'Двері вхідні - варіант'
    label_plural 'Двері вхідні - варіанти'

    list do
      field :id
      field :full_name
      field :full_slug
      field :one_c_id
    end

    edit do
      field :exterior_door_color_id, :enum do
        enum do
          Catalog::Door::ExteriorDoorColor.includes(:exterior_door).all.map { |i| [i.exterior_door.title + ', ' + i.name, i.id] }
          # ExteriorDoorColor.all.map { |i| [i.name, i.id] }
        end
        label "Двері:"
      end
      field :width do
        label 'Ширина:'
      end
      field :height do
        label 'Висота:'
      end
      field :segment do
        label 'Сегмент:'
      end
      field :coating_type do
        label 'Покриття:'
      end
      field :opening_side do
        label 'Схема відкривання:'
      end

      field :one_c_id do
        label 'Ідентифікатор з 1С'
      end

      # field :recommended do
      #   label 'Рекомендуємо?'
      #   help 'для відображення на головній сторінці.'
      # end
      #
      # field :promotion do
      #   label 'Акційні?'
      #   help 'поле призначене для програміста'
      # end
      # field :new do
      #   label 'Нові?'
      #   help 'поле призначене для програміста'
      # end
    end
  end

  def available_sizes
    if (product_color rescue false)
      product_color.catalog_door_exterior_door_variants.pluck(:width).uniq
    else
      []
    end
  end

  def current_price
    if price.present?
      price
    elsif price_minimal.present?
      price_minimal
    elsif price_group_first.present?
      price_group_first
    elsif price_group_second.present?
      price_group_second
    end
  end

  def current_currency
    if currency == 'uah'
      # t("enumerize.currency.#{currency}")
      'грн.'
    elsif currency == 'usd'
      # t("enumerize.currency.#{currency}")
      'дол.'
    elsif currency == 'eur'
      # t("enumerize.currency.#{currency}")
      'євро'
    end
  end

  def variants_by_width
    # product_color.catalog_door_exterior_door_variants.pluck(:width).uniq
  end
  def variants_by_height

  end
  def variants_by_segment

  end
  def variants_by_coating_type

  end
  def variants_by_opening_side

  end

  def variants_by_color
    Catalog::Door::ExteriorDoorVariant.joins(:exterior_door_color)
        .where(exterior_door_color_id: self.exterior_door_color_id)
  end
  def available_heights
    variants_by_color.where(width: self.width).pluck(:height).uniq
  end
  def available_segment
    variants_by_color.where(width: self.width).where(height: self.height).pluck(:segment).uniq
  end
  def available_coating_types
    variants_by_color.where(width: self.width).where(height: self.height).where(segment: self.segment).pluck(:coating_type).uniq
  end
  def available_opening_side
    variants_by_color.where(width: self.width).where(height: self.height).where(segment: self.segment).where(coating_type: self.coating_type).pluck(:opening_side).uniq
  end
end

