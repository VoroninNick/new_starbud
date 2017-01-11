# == Schema Information
#
# Table name: catalog_wall_producers
#
#  id         :integer          not null, primary key
#  name       :string
#  slug       :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Catalog::Wall::Producer < ActiveRecord::Base
  attr_accessible *attribute_names

  has_many :catalog_wall_wallpapers, :class_name => 'Catalog::Wall::Wallpaper', foreign_key: :catalog_wall_producer_id

  def to_slug
    "#{name.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug

  rails_admin do
    navigation_label 'Каталог'

    label 'Виробник декору для стіни'
    label_plural 'Виробники декорів для стіни'

    list do
      field :name
      field :slug
      field :country
    end

    edit do
      field :name do
        label 'Назва:'
      end
      field :country do
        label "Країна виробника:"
      end
    end
  end
end
