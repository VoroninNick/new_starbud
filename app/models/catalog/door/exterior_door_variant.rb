# t.integer :width
# t.integer :height
# t.string :segment
# t.string :coating_type
# t.string :opening_side
#
# t.belongs_to :exterior_door_color
#
# t.string :one_c_id
#
# t.string :price
# t.string :price_minimal
# t.string :price_group_first
# t.string :price_group_second
# t.string :currency

class Catalog::Door::ExteriorDoorVariant < ActiveRecord::Base
  attr_accessible *attribute_names

  extend Enumerize

  belongs_to :exterior_door_color, :class_name => 'Catalog::Door::ExteriorDoorColor'

  validates_presence_of :width, :height, :segment, :coating_type, :opening_side

  enumerize :opening_side, in: [:'left', :'right']
  enumerize :coating_type, in: [:'apartment', :'street']

  rails_admin do
    navigation_label 'Каталог'

    label 'Двері вхідні - варіант'
    label_plural 'Двері вхідні - варіанти'

    list do
      # field :title
      # field :door_producer
      # # field :door_collection
      # field :description
    end

    edit do
      field :exterior_door_color_id, :enum do
        enum do
          Catalog::Door::ExteriorDoorColor.includes(:exterior_door).all.map { |i| [i.exterior_door.title + ', ' + i.name, i.id] }
          # ExteriorDoorColor.all.map { |i| [i.name, i.id] }
        end
        label "Двері:"
      end
      field :width do
        label 'Ширина:'
      end
      field :height do
        label 'Висота:'
      end
      field :segment do
        label 'Сегмент:'
      end
      field :coating_type do
        label 'Покриття:'
      end
      field :opening_side do
        label 'Схема відкривання:'
      end

      field :one_c_id do
        label 'Ідентифікатор з 1С'
      end
    end
  end
end

