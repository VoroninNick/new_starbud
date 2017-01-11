# == Schema Information
#
# Table name: catalog_floor_floors
#
#  id                          :integer          not null, primary key
#  floor_type                  :string
#  name                        :string
#  slug                        :string
#  full_name                   :string
#  full_slug                   :string
#  marking                     :string
#  amount                      :float
#  product_unit                :string
#  avatar_file_name            :string
#  avatar_content_type         :string
#  avatar_file_size            :integer
#  avatar_updated_at           :datetime
#  perspective_file_name       :string
#  perspective_content_type    :string
#  perspective_file_size       :integer
#  perspective_updated_at      :datetime
#  structure_file_name         :string
#  structure_content_type      :string
#  structure_file_size         :integer
#  structure_updated_at        :datetime
#  interior_file_name          :string
#  interior_content_type       :string
#  interior_file_size          :integer
#  interior_updated_at         :datetime
#  one_c_id                    :string
#  price                       :string
#  price_minimal               :string
#  price_group_first           :string
#  price_group_second          :string
#  currency                    :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  catalog_floor_collection_id :integer
#

# t.string :floor_type
# t.string :name
# t.string :slug
# t.string :full_name
# t.string :full_slug

# t.string :marking
# t.float :amount
# t.string :product_unit

# t.attachment :avatar
# t.attachment :perspective
# t.attachment :structure
# t.attachment :interior

# t.string :one_c_id

# t.string :price
# t.string :price_minimal
# t.string :price_group_first
# t.string :price_group_second
# t.string :currency

class Catalog::Floor::Floor < ActiveRecord::Base
  attr_accessible *attribute_names

  validates_presence_of :name, :marking

  has_one :product_addition_option, as: :productable, dependent: :destroy

  belongs_to :catalog_floor_collection, :class_name => 'Catalog::Floor::Collection'

  extend Enumerize

  enumerize :floor_type, in: [ :laminate, :parquetry, :linoleum, :carpet, :decking]

  attr_accessible :product_addition_option_attributes
  accepts_nested_attributes_for :product_addition_option, :allow_destroy => true

  attr_accessible :avatar, :perspective, :structure, :interior

  has_attached_file :avatar,
                    styles: { large: "320x220>"},
                    convert_options: { large: "-quality 94 -interlace Plane"},
                    default_url: "/images/:style/missing.png"

  has_attached_file :perspective,
                    styles: { large: "320x180>"},
                    convert_options: { large: "-quality 94 -interlace Plane"},
                    default_url: "/images/:style/missing.png"

  has_attached_file :structure,
                    styles: { large: "320x1800>"},
                    convert_options: { large: "-quality 94 -interlace Plane"},
                    default_url: "/images/:style/missing.png"

  has_attached_file :interior,
                    styles: { large: "320x180>"},
                    convert_options: { large: "-quality 94 -interlace Plane"},
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :perspective, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :structure, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :interior, content_type: /\Aimage\/.*\Z/


  def composed_full_name
    [name, marking]
  end
  def generate_full_name
    composed_full_name.map{|param| param.to_s.underscore }.join(" ")
  end
  def create_full_name
    self.full_name = generate_full_name
  end

  def create_full_slug
    self.full_slug = generate_full_name.parameterize
  end




  before_save :create_full_name, :create_full_slug

  rails_admin do
    navigation_label 'Каталог'

    label 'Підлога'
    label_plural 'Підлога'

    list do
      field :id
      field :floor_type
      field :full_name
      field :full_slug
      field :one_c_id
    end

    edit do
      field :floor_type do
        label 'Вид підлоги:'
      end
      field :name do
        label 'Назва:'
      end
      # field :catalog_floor_collection do
      #   label 'Коллекція'
      # end

      field :catalog_floor_collection_id, :enum do
        enum do
          Catalog::Floor::Collection.includes(:catalog_floor_brand).all.map { |i| [i.catalog_floor_brand.name + ', ' + i.name, i.id] }
        end
        label "Колекція:"
      end

      field :avatar, :paperclip do
        label 'Головне зображення:'
        help 'Зображення вантажити лише в форматі jpg 320х220 pixels'
      end
      field :marking do
        label 'Артикул:'
      end
      field :one_c_id do
        label 'Ідентифікатор з 1С:'
      end
      # field :amount do
      #   label 'Кількість:'
      # end
      field :perspective, :paperclip do
        label 'Перспектива:'
        help 'Зображення вантажити лише в форматі jpg 320x180 pixels'
      end
      field :structure, :paperclip do
        label 'Структура:'
        help 'Зображення вантажити лише в форматі jpg 320x180 pixels'
      end
      field :interior, :paperclip do
        label "Інтер'єр:"
        help 'Зображення вантажити лише в форматі jpg 320x180 pixels'
      end
      field :product_addition_option do
        label 'Додаткова інформація:'
        help 'Короткий опис, Характеристики, Догляд, Умови гарантії...'
      end
    end
  end

  default_scope { order('created_at desc') }

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

  paginates_per 12

  filterrific(
      default_filter_params: { sorted_by: 'name_desc' },
      available_filters: [
          :sorted_by
      ]
  )



#   sorted by
  scope :sorted_by, lambda { |sort_key|
    direction = (sort_key =~ /desc$/) ? 'desc' : 'asc'
    case sort_key.to_s
      when /^name_/
        order("catalog_floor_floors.name #{ direction }")
      else
        raise(ArgumentError, "Invalid sort option: #{ sort_key.inspect }")
    end
  }
  def self.options_for_sorted_by
    [
        ['Сортувати за алфавітом: нові', 'name_desc'],
        ['Сортувати за алфавітом: старі', 'name_asc']
    ]
  end
end
