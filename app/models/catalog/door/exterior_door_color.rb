# t.string :name
# t.string :slug
# t.attachment :icon
# t.belongs_to :exterior_door

class Catalog::Door::ExteriorDoorColor < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :exterior_door, :class_name => 'Catalog::Door::ExteriorDoor'
  has_many :catalog_door_exterior_door_variants, :class_name => 'Catalog::Door::ExteriorDoorVariant'

  attr_accessible :icon

  has_attached_file :icon,
                    styles: { large: "360x80>", three: "320x80>", two: "160x80>", thumb: "80x80>"},
                    convert_options: {
                        large: "-quality 94 -interlace Plane",
                        three: "-quality 94 -interlace Plane",
                        two: "-quality 94 -interlace Plane",
                        thumb: "-quality 94 -interlace Plane"
                    },
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/

  validates :name, :presence => true

  def product
    exterior_door
  end

  def to_slug
    "#{name.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug

  rails_admin do
    visible false
    # navigation_label 'Каталог'

    list do
    end

    edit do
      field :name do
        label 'Назва:'
      end
      field :icon, :paperclip do
        label 'Іконка:'
        help 'Зображення вантажити лише в форматі jpg 80x360 pixels'
      end

    end
  end
end
