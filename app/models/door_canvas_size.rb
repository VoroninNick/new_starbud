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

end
