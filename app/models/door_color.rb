# == Schema Information
#
# Table name: door_colors
#
#  id                 :integer          not null, primary key
#  name               :string
#  slug               :string
#  icon_file_name     :string
#  icon_content_type  :string
#  icon_file_size     :integer
#  icon_updated_at    :datetime
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  door_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

# t.string :name
# t.string :slug
# t.attachment :icon
# t.attachment :image
# t.belongs_to :door
class DoorColor < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :door
  has_many :door_variants
  has_many :door_variant_welts
  has_many :door_variant_frames
  has_many :door_variant_additional_boards
  has_many :door_variant_strips
  has_many :door_variant_additional_options


  has_one :door_collection, through: :door
  has_one :door_producer, through: :door

  attr_accessible :door_variants
  accepts_nested_attributes_for :door_variants, allow_destroy: true
  attr_accessible :door_variants_attributes

  attr_accessible :door_variant_welts
  accepts_nested_attributes_for :door_variant_welts, allow_destroy: true
  attr_accessible :door_variant_welts_attributes

  attr_accessible :door_variant_frames
  accepts_nested_attributes_for :door_variant_frames, allow_destroy: true
  attr_accessible :door_variant_frames_attributes

  attr_accessible :door_variant_additional_boards
  accepts_nested_attributes_for :door_variant_additional_boards, allow_destroy: true
  attr_accessible :door_variant_additional_boards_attributes

  attr_accessible :door_variant_strips
  accepts_nested_attributes_for :door_variant_strips, allow_destroy: true
  attr_accessible :door_variant_strips_attributes

  attr_accessible :door_variant_additional_options
  accepts_nested_attributes_for :door_variant_additional_options, allow_destroy: true
  attr_accessible :door_variant_additional_options_attributes

  attr_accessible :image, :icon

  has_attached_file :icon,
                    styles: { large: "360x80>", three: "320x80>", two: "160x80>", thumb: "80x80>"},
                    convert_options: {
                        large: "-quality 94 -interlace Plane",
                        three: "-quality 94 -interlace Plane",
                        two: "-quality 94 -interlace Plane",
                        thumb: "-quality 94 -interlace Plane"
                    },
                    default_url: "/images/:style/missing.png"

  has_attached_file :image,
                    styles: { large: "300x600>"},
                    convert_options: { large: "-quality 94 -interlace Plane"},
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :name, :presence => true

  def product
    door
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
    navigation_label 'Каталог'

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
      field :image, :paperclip do
        label 'Зображення:'
        help 'Зображення вантажити лише в форматі jpg 300x700 pixels'
      end

      # field :promotion do
      #   label 'Акційні?'
      # end
      # field :new do
      #   label 'Нові?'
      # end
      # field :recommended do
      #   label 'Рекомендуємо?'
      #   help 'для відображення на головній сторінці.'
      # end

      field :door_variants do
        label 'Варіанти дверей:'
      end

      field :door_variant_additional_boards do
        label 'Добірна дошка:'
      end

      field :door_variant_frames do
        label 'Коробка:'
      end

      field :door_variant_welts do
        label 'Лиштва:'
      end

      field :door_variant_strips do
        label 'Притворна планка:'
      end

      field :door_variant_additional_options do
        label 'Додаткові опції:'
      end

    end
  end
end
