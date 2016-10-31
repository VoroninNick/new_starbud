# == Schema Information
#
# Table name: door_variants
#
#  id                 :integer          not null, primary key
#  door_id            :integer
#  name_color         :string
#  icon_file_name     :string
#  icon_content_type  :string
#  icon_file_size     :integer
#  icon_updated_at    :datetime
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  slug               :string
#  canvas_size        :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  price              :string
#  price_minimal      :string
#  price_group_first  :string
#  price_group_second :string
#  currency           :string
#  promotion          :boolean
#  new                :boolean
#  recommended        :boolean
#  door_color_id      :integer
#  one_c_id           :string
#  full_name          :string
#  full_slug          :string
#

# t.belongs_to :door
# t.string :name_color
# t.attachment :icon
# t.attachment :image
# t.string :slug
# t.integer :canvas_size

# t.string :price
# t.string :price_minimal
# t.string :price_group_first
# t.string :price_group_second
# t.string :currency

# t.boolean :promotion
# t.boolean :new
# t.boolean :recommended

# t.belongs_to :door_color

# t.string :one_c_id

def canvas_size_enum_field
  field :canvas_size, :enum do
    enum_method :available_sizes
    label 'Розмір полотна:'
    help do
     unless @bindings[:object].persisted?
       "Спочатку збережіть одиницю для можливості встановити розмір полотна"
     else
       "Виберіть розмір полотна"
     end

    end

    visible do
      true
    end
  end
end

class DoorVariant < ActiveRecord::Base
  attr_accessible *attribute_names

  extend Enumerize
  enumerize :currency, in: [:'uah', :'usd', :'eur']

  belongs_to :door_color

  has_one :door_producer, through: :door_color

  has_price



  attr_accessible :image, :icon

  has_attached_file :icon,
                    styles: { large: "240x240>"},
                    convert_options: { large: "-quality 94 -interlace Plane"},
                    default_url: "/images/:style/missing.png"

  has_attached_file :image,
                    styles: { large: "300x600>"},
                    convert_options: { large: "-quality 94 -interlace Plane"},
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  validates :canvas_size, :presence => true, if: -> { persisted? }

  def to_parameterize
    "#{door_color.name.parameterize}"
  end
  def create_slug
    "#{to_parameterize} #{canvas_size}"
  end

  def save_slug
    self.slug = create_slug
  end


  def generate_full_slug
    params = [product_color.product.slug, product_color.slug, canvas_size]
    product_url_fragment = params.map{|param| param.to_s.underscore }.join("-")
  end
  def create_full_slug
    self.full_slug = generate_full_slug
  end



  def generate_full_name
    params = [product_color.product.title, product_color.name, canvas_size]
    params.map{|param| param.to_s.underscore }.join(" ")
  end
  def create_full_name
    self.full_name = generate_full_name
  end


  before_save :save_slug, :create_full_name, :create_full_slug

  def base_url
    "/dashboard/doors/product/"
  end

  def product_color
    door_color
  end

  def url
    base_url + generate_full_slug
  end

  def full_name
    generate_full_name
  end

  rails_admin do
    visible false

    label 'Варіант дверей'
    label_plural 'Варіанти дверей'
    object_label_method :slug

    list do
      field :one_c_id do
        label 'Ідентифікатор з 1С'
      end
      field :slug do
        label 'назва'
      end

    end

    edit do
      field :full_name do
        label 'Full name:'
      end
      field :full_slug do
        label 'Full slug:'
      end
      field :one_c_id do
        label 'Ідентифікатор з 1С'
        help 'Поле для вводу ID товару з 1С'
      end
      field :door_color
      canvas_size_enum_field

      # field :promotion do
      #   label 'Акційні?'
      # end
      # field :new do
      #   label 'Нові?'
      # end
      field :recommended do
        label 'Рекомендуємо?'
        help 'для відображення на головній сторінці.'
      end

      # field :prices do
      #   label '0-Ціна:'
      # end

      # group :prices do
      #   label 'Ціна'
      #   active true
      #
      #   field :currency, :enum do
      #     label 'Валюта:'
      #   end
      #
      #   field :price_minimal do
      #     label 'Мінімальна:'
      #   end
      #   field :price_group_first do
      #     label 'Гурт 1:'
      #   end
      #   field :price_group_second do
      #     label 'Гурт 2:'
      #   end
      #   field :price do
      #     label 'Прайс:'
      #   end
      #
      # end

    end

    nested do
      field :one_c_id do
        label 'Ідентифікатор з 1С'
        help 'Поле для вводу ID товару з 1С'
      end
      field :door_color do
        visible false
      end
      canvas_size_enum_field

    end

  end

  def available_sizes
    if (door_producer rescue false)
      door_producer.door_canvas_sizes.pluck(:name)
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

  scope :find_product_variant_by_string, ->(str) {
    params_arr = str.split("-")
    product = params_arr.first
    product_color = params_arr.second
    product_canvas_size = params_arr.last
    find_product_variant(product_canvas_size, product_color, product)
  }
  # @door_variant = product_class.joins(door_color: { door: {} }).where(doors: { slug: product }, door_colors: { slug: product_color }, canvas_size: product_canvas_size).first

  scope :find_product_variant, ->(product_canvas_size, product_color, product) { joins(door_color: { door: {} }).where(doors: { slug: product }, door_colors: { slug: product_color } )}
end
