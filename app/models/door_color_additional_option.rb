# t.string :title
# t.string :slug
# t.belongs_to :door_variant_color
#
# t.string :canvas_size
# t.string :box
# t.string :welt
#
# t.string :price
# t.string :price_minimal
# t.string :price_group_first
# t.string :price_group_second
#
# t.string :currency
class DoorColorAdditionalOption < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :door_variant_color

end
