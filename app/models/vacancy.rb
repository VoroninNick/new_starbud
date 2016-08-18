# t.string :title
# t.string :slug
# t.string :city
# t.text :description
# t.boolean :published
# t.integer :position

class Vacancy < ActiveRecord::Base

  attr_accessible *attribute_names

  def to_slug
    "vacancy-#{title.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug



  rails_admin do
    navigation_label 'Ваканції'

    label 'Ваканції'
    label_plural 'Ваканція'

    list do

    end

    edit do
      field :published do
        label 'Чи публікувати?'
      end
      field :title do
        label 'Назва:'
      end
      field :city do
        label 'Місто:'
      end
      field :description, :ck_editor do
        label 'Опис:'
        help 'Використовувати теги h3, h4, h5, h6, p, blockquote, <ul or ol> <li> <span>text</span></li></ul or /ol>'
      end
      field :position do
        label 'Позиція:'
        help 'Якщо бажаєте змінити позицію...'
      end
    end

  end
end
