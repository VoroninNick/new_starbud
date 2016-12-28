# t.string :name
# t.string :slug
# t.string :key


# t.string :one_c_id

class DoorAdditionalFunction < ActiveRecord::Base
  attr_accessible *attribute_names

  def to_slug
    "#{name.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug

  rails_admin do
    navigation_label 'Каталог'

    label 'Двері міжкімнатні - додаток'
    label_plural 'Двері міжкімнатні - додатки'

    list do
      field :name
      field :slug
      field :key
      field :one_c_id
    end

    edit do
      field :name do
        label 'Назва:'
      end
      field :one_c_id do
        label 'Ідентифікатор з 1С:'
      end

      group :specification do
        label 'Опції для програміста'
        help 'Не змінювати значень, вони використовуються для привязки коду!!!'
        active false

        field :key do
          label 'Ключ:'
        end

      end
    end
  end
end
