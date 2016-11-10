# == Schema Information
#
# Table name: door_producers
#
#  id         :integer          not null, primary key
#  title      :string
#  slug       :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# t.string :title
# t.string :slug
# t.string :country
# t.integer :height
class DoorProducer < ActiveRecord::Base
  attr_accessible *attribute_names

  has_many :door_collections
  attr_accessible :door_collections
  accepts_nested_attributes_for :door_collections, allow_destroy: true
  attr_accessible :door_collections_attributes

  has_many :door_canvas_sizes
  attr_accessible :door_canvas_sizes
  accepts_nested_attributes_for :door_canvas_sizes, allow_destroy: true
  attr_accessible :door_canvas_sizes_attributes

  def to_slug
    "#{title.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug

  rails_admin do
    navigation_label 'Каталог'

    label 'Виробник дверей'
    label_plural 'Виробники дверей'

    list do
      field :title
      field :slug
      field :country
      field :height
    end

    edit do
      field :title do
        label 'Назва:'
      end
      field :country do
        label "Країна виробника:"
      end
      field :height do
        label "Висота дверей:"
      end
      field :door_canvas_sizes do
        label "Доступні розміри полотна:"
      end
      field :door_collections do
        label "Колекції:"
      end
    end
  end
end