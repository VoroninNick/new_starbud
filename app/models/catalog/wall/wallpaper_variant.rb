# == Schema Information
#
# Table name: catalog_wall_wallpaper_variants
#
#  id                        :integer          not null, primary key
#  name                      :string
#  slug                      :string
#  icon_file_name            :string
#  icon_content_type         :string
#  icon_file_size            :integer
#  icon_updated_at           :datetime
#  avatar_file_name          :string
#  avatar_content_type       :string
#  avatar_file_size          :integer
#  avatar_updated_at         :datetime
#  catalog_wall_wallpaper_id :integer
#  amount_pack               :integer
#  available_amount          :integer
#  one_c_id                  :string
#  price                     :string
#  price_minimal             :string
#  price_group_first         :string
#  price_group_second        :string
#  currency                  :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class Catalog::Wall::WallpaperVariant < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :catalog_wall_wallpaper, :class_name => 'Catalog::Wall::Wallpaper', foreign_key: :catalog_wall_wallpaper_id

  attr_accessible :icon, :avatar

  has_attached_file :icon,
                    styles: { large: "360x80>", three: "320x80>", two: "160x80>", thumb: "80x80>"},
                    convert_options: {
                        large: "-quality 94 -interlace Plane",
                        three: "-quality 94 -interlace Plane",
                        two: "-quality 94 -interlace Plane",
                        thumb: "-quality 94 -interlace Plane"
                    },
                    default_url: "/images/:style/missing.png"

  has_attached_file :avatar,
                    styles: { large: "400x250>"},
                    convert_options: { large: "-quality 94 -interlace Plane"},
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def to_slug
    "#{name.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug

  rails_admin do
    visible false

    list do
      field :id
      field :name
      field :slug
      field :one_c_id
      field :avatar
    end

    edit do
      field :name do
        label 'Назва:'
      end
      field :one_c_id do
        label 'Ідентифікатор з 1С'
      end
      field :icon, :paperclip do
        label 'Іконка:'
        help 'Зображення вантажити лише в форматі jpg 360x80 pixels'
      end
      field :avatar, :paperclip do
        label 'Аватар:'
        help 'Зображення вантажити лише в форматі jpg 400x250 pixels'
      end
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
    else
      2300
    end
  end

  def current_currency
    if currency == 'uah'
      'грн.'
    elsif currency == 'usd'
      'дол.'
    elsif currency == 'eur'
      'євро'
    end
  end

  def amount_pack
    if amount_pack.present?
      amount_pack
    else
      11
    end
  end

  def one_price
    # current_price/amount_pack
    110
  end

end
