# == Schema Information
#
# Table name: catalog_floor_collections
#
#  id                     :integer          not null, primary key
#  name                   :string
#  slug                   :string
#  catalog_floor_brand_id :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

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
