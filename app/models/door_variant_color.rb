# t.string :name
# t.attachment :image
# t.belongs_to :door
class DoorVariantColor < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :door
  has_many :door_color_additional_options
  attr_accessible :door_color_additional_options
  accepts_nested_attributes_for :door_color_additional_options, allow_destroy: true
  attr_accessible :door_color_additional_options_attributes

end
