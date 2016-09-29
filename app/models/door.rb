# t.string :title
# t.string :slug
# t.string :brand
# t.text :description
# t.string :type

class Door < ActiveRecord::Base
  attr_accessible *attribute_names

  has_many :door_variant_colors
  attr_accessible :door_variant_colors
  accepts_nested_attributes_for :door_variant_colors, allow_destroy: true
  attr_accessible :door_variant_colors_attributes


end
