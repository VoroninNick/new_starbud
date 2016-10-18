# t.string :title
# t.string :slug
# t.belongs_to :door_producer

class DoorCollection < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :door_producer

  def to_slug
    "#{title.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug

  rails_admin do
    visible false

    label 'Колекція дверей'
    label_plural 'Колекції дверей'

    list do
    end

    edit do
      field :title do
        label 'Назва:'
      end
    end
  end
end
