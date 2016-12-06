# t.belongs_to :door_collection

class Catalog::Door::ExteriorDoor < ActiveRecord::Base
  attr_accessible *attribute_names

  # extend Enumerize
  # enumerize :product_type, in: [:'the_entrance', :'interior']

  belongs_to :door_collection
  has_one :door_producer, through: :door_collection


  attr_accessible :image

  has_attached_file :image,
                    styles: { large: "300x700>"},
                    convert_options: { large: "-quality 94 -interlace Plane"},
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :catalog_door_exterior_door_colors, :class_name => 'Catalog::Door::ExteriorDoorColor'
  attr_accessible :catalog_door_exterior_door_colors
  accepts_nested_attributes_for :catalog_door_exterior_door_colors, allow_destroy: true
  attr_accessible :catalog_door_exterior_door_colors_attributes


  def to_slug
    "#{title.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug


  rails_admin do
    navigation_label 'Каталог'

    label 'Двері вхідні'
    label_plural 'Двері вхідні'

    list do
      field :title
      field :door_producer
      # field :door_collection
      field :description
    end

    edit do
      field :title do
        label 'Назва:'
      end

      field :door_collection_id, :enum do
        enum do
          DoorCollection.includes(:door_producer).all.map { |i| [i.door_producer.title + ', ' + i.title, i.id] }

        end
        label "Колекція:"
      end

      field :image, :paperclip do
        label 'Зображення:'
        help 'Зображення вантажити лише в форматі jpg 300x700 pixels'
      end

      field :description do
        html_attributes rows: 10, cols: 100
        label 'Короткий опис:'
      end
      field :catalog_door_exterior_door_colors do
        label 'Кольори дверей:'
      end

      group :specification do
        label 'Додаткові опції'
        active false

        field :specification, :ck_editor do
          label 'Технічні характеристики:'
        end
        field :attention, :ck_editor do
          label 'Догляд:'
        end
        field :warranty, :ck_editor do
          label 'Умови гарантії:'
        end
      end
    end
  end

  # def available_sizes
  #   if (door_producer rescue false)
  #     door_producer.door_canvas_sizes.pluck(:name)
  #   else
  #     []
  #   end
  #
  # end

  scope :with_recommended_variant, -> () {
    joins(catalog_door_exterior_door_colors: { catalog_door_exterior_door_variants: {} }).where(catalog_door_exterior_door_variants: { recommended: "t" }).uniq
  }
  # scope :with_news_variant, -> () {
  #   with_recommended_variant.where(door_variants: { new: "t" })
  # }
  # scope :with_promotion_variant, -> () {
  #   with_recommended_variant.where(door_variants: { promotion: "t" })
  # }

  def available_colors
    self.catalog_door_exterior_door_colors.uniq
  end

  # paginates_per 12
  #
  # filterrific(
  #     default_filter_params: { sorted_by: 'title_desc' },
  #     available_filters: [
  #         :sorted_by,
  #         :with_product_type
  #     ]
  # )
  #
  #
  #
  # #   sorted by
  # scope :sorted_by, lambda { |sort_key|
  #   direction = (sort_key =~ /desc$/) ? 'desc' : 'asc'
  #   case sort_key.to_s
  #     when /^title_/
  #       order("doors.title #{ direction }")
  #     else
  #       raise(ArgumentError, "Invalid sort option: #{ sort_key.inspect }")
  #   end
  # }
  # def self.options_for_sorted_by
  #   [
  #       ['Сортувати за алфавітом: нові', 'title_desc'],
  #       ['Сортувати за алфавітом: старі', 'title_asc']
  #   ]
  # end
  #
  # #  product_type
  # scope :with_product_type, lambda { |value|
  #   where(product_type: [value])
  # }

end

# module Catalog
#   module Door
#     class ExteriorDoor < ActiveRecord::Base
#     end
#
#   end
# end
