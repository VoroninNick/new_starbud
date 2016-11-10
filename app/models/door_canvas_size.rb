# == Schema Information
#
# Table name: door_canvas_sizes
#
#  id               :integer          not null, primary key
#  door_producer_id :integer
#  name             :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

# t.belongs_to :door_producer
# t.integer :name

class DoorCanvasSize < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :door_producer

  rails_admin do
    visible false

    label 'Розмір полотна'
    label_plural 'Розміри полотна'


    list do
      field :name do
        label 'Розмір:'
      end
    end

    edit do
      field :name do
        label 'Розмір:'
        help 'наприклад 600'
      end

    end
  end

  def to_s
    # 600x2000
    w = name
    h = door_producer.height
    [w,h].join("x")
  end

end
