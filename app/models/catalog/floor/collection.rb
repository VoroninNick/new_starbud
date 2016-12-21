# t.string :name
# t.string :slug
# t.belongs_to :catalog_floor_brand
class Catalog::Floor::Collection < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :catalog_floor_brand, :class_name => 'Catalog::Floor::Brand', foreign_key: :catalog_floor_brand_id
  has_one :catalog_floor_collection

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
    end
  end
end
