# t.string :name
# t.string :country
# t.string :slug
class Catalog::Floor::Brand < ActiveRecord::Base
  attr_accessible *attribute_names

  has_many :catalog_floor_collections, :class_name => 'Catalog::Floor::Collection', foreign_key: :catalog_floor_brand_id
  attr_accessible :catalog_floor_collections
  accepts_nested_attributes_for :catalog_floor_collections, allow_destroy: true
  attr_accessible :catalog_floor_collections_attributes

  def to_slug
    "#{name.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug

  rails_admin do
    navigation_label 'Каталог'

    label 'Виробник підлоги'
    label_plural 'Виробники підлоги'

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
      field :catalog_floor_collections do
        label "Колекції:"
      end

    end
  end
end
