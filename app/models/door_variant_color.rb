# t.string :name
# t.string :slug
# t.attachment :icon
# t.attachment :image
# t.belongs_to :door
class DoorVariantColor < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :door
  has_many :door_color_additional_options
  attr_accessible :door_color_additional_options
  accepts_nested_attributes_for :door_color_additional_options, allow_destroy: true
  attr_accessible :door_color_additional_options_attributes

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

  validates :name, :presence => true, :uniqueness => true

  def to_slug
    "#{name.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug

  rails_admin do
    navigation_label 'Каталог'

    label 'Колір дверей'
    label_plural 'Кольори дверей'

    list do
    end

    edit do
      field :name do
        label 'Назва:'
      end
      field :door do
        label 'Двері:'
      end
      field :icon, :paperclip do
        label 'Іконка:'
        help 'Зображення вантажити лише в форматі jpg 80x80 pixels'
      end
      field :image, :paperclip do
        label 'Зображення:'
        help 'Зображення вантажити лише в форматі jpg 300x700 pixels'
      end
      field :door_color_additional_options do
        label 'Варіанти дверей:'
      end

    end
  end
end
