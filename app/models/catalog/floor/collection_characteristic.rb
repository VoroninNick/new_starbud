# t.string :key
# t.string :key_slug
#
# t.string :value
# t.string :value_slug
#
# t.attachment :avatar
#
# t.belongs_to :catalog_floor_collection

class Catalog::Floor::CollectionCharacteristic < ActiveRecord::Base
  attr_accessible *attribute_names

  attr_accessible :avatar
  has_attached_file :avatar,
                    styles: { thumb: "80x80>"},
                    convert_options: { large: "-quality 94 -interlace Plane"},
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  belongs_to :catalog_floor_collection, :class_name => 'Catalog::Floor::Collection', foreign_key: :catalog_floor_collection_id

  def name_to_slug
    "#{key.parameterize}"
  end
  def value_to_slug
    "#{value.parameterize}"
  end
  def save_slug
    self.key_slug = name_to_slug
    self.value_slug = value_to_slug
  end
  before_save :save_slug

  rails_admin do
    visible false

    label 'Колекція - характеристика'
    label_plural 'Колекції - характеристики'

    list do
    end

    edit do
      field :key do
        label 'Назва:'
      end
      field :value do
        label 'Значення:'
      end
      field :avatar, :paperclip do
        label 'Іконка:'
        help 'Зображення вантажити лише в форматі jpg 80х80 pixels'
      end
    end
  end
end
