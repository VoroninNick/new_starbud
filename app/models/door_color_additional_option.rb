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

  extend Enumerize
  # attr_accessor :decor, :kapinos, :type, :material, :type_of_surface
  enumerize :currency, in: [:'uah', :'usd', :'eur']

  belongs_to :door_variant_color

  validates :canvas_size, :presence => true
  validates :box, :presence => true

  def generated_name
    "#{canvas_size} #{box}"
  end
  def save_name
    self.title = generated_name
  end
  def to_slug
    "#{generated_name.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug, :save_name

  rails_admin do
    visible false

    list do
    end

    edit do
      # field :title do
      #   label 'Назва:'
      # end
      field :canvas_size do
        label 'Розмір полотна:'
      end
      field :box do
        label 'Коробка:'
      end
      field :welt do
        label 'Лиштва:'
      end

      group :prices do
        label 'Ціна'
        active true

        field :currency, :enum do
          label 'Валюта:'
        end

        field :price_minimal do
          label 'Мінімальна:'
        end
        field :price_group_first do
          label 'Гурт 1:'
        end
        field :price_group_second do
          label 'Гурт 2:'
        end
        field :price do
          label 'Прайс:'
        end

      end
    end
  end
end
