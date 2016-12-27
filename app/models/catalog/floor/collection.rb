# t.string :name
# t.string :slug
# t.belongs_to :catalog_floor_brand
class Catalog::Floor::Collection < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :catalog_floor_brand, :class_name => 'Catalog::Floor::Brand', foreign_key: :catalog_floor_brand_id
  has_one :catalog_floor_collection

  has_many :catalog_floor_collection_characteristics, :class_name => 'Catalog::Floor::CollectionCharacteristic', foreign_key: :catalog_floor_collection_id

  attr_accessible :catalog_floor_collection_characteristics
  accepts_nested_attributes_for :catalog_floor_collection_characteristics, allow_destroy: true
  attr_accessible :catalog_floor_collection_characteristics_attributes

  def to_slug
    "#{name.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug

  rails_admin do
    visible false

    label 'Колекція'
    label_plural 'Колекції'

    list do
    end

    edit do
      field :name do
        label 'Назва:'
      end
      field :catalog_floor_collection_characteristics do
        label "Характеристики:"
      end
    end
  end
end
