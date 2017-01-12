# == Schema Information
#
# Table name: catalog_wall_wallpapers
#
#  id                       :integer          not null, primary key
#  name                     :string
#  short_description        :text
#  catalog_wall_producer_id :integer
#  image_file_name          :string
#  image_content_type       :string
#  image_file_size          :integer
#  image_updated_at         :datetime
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  slug                     :string
#

class Catalog::Wall::Wallpaper < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :catalog_wall_producer, :class_name => 'Catalog::Wall::Producer', foreign_key: :catalog_wall_producer_id
  has_one :product_addition_option, as: :productable, dependent: :destroy
  has_many :catalog_wall_wallpaper_variants, :class_name => 'Catalog::Wall::WallpaperVariant', foreign_key: :catalog_wall_wallpaper_id

  attr_accessible :product_addition_option_attributes
  accepts_nested_attributes_for :product_addition_option, :allow_destroy => true

  attr_accessible :catalog_wall_wallpaper_variants_attributes
  accepts_nested_attributes_for :catalog_wall_wallpaper_variants, allow_destroy: true

  attr_accessible :image
  has_attached_file :image,
                    styles: { large: "600x450>"},
                    convert_options: { large: "-quality 94 -interlace Plane"},
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def to_slug
    "#{name.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug

  rails_admin do
    navigation_label 'Каталог'

    label 'Стіна - Шпалера'
    label_plural 'Стіна - Шпалери'

    list do
      field :id
      field :catalog_wall_producer
      field :name
      field :slug
      field :image
    end

    edit do
      field :catalog_wall_producer do
        label 'Виробник:'
      end
      field :name do
        label 'Назва:'
      end
      field :image, :paperclip do
        label "Інтер'єр:"
        help 'Зображення вантажити лише в форматі jpg 600х450 pixels'
      end
      field :catalog_wall_wallpaper_variants do
        label 'Варіанти кольорів:'
      end
      field :product_addition_option do
        label 'Додаткова інформація:'
        help 'Короткий опис, Характеристики, Догляд, Умови гарантії...'
      end
    end
  end
end
