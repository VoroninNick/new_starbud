# t.string :name
# t.has_attached_file :logo
# t.integer :position
# t.boolean :published

class Partner < ActiveRecord::Base

  attr_accessible *attribute_names

  attr_accessible :logo
  has_attached_file :logo
  validates_attachment :logo,
                       :content_type => { :content_type => ['image/svg+xml'] }

  rails_admin do
    navigation_label 'Наші партнери'

    label 'Партнер'
    label_plural 'Партнери'

    list do

    end

    edit do
      field :published do
        label 'Чи публікувати?'
      end
      field :name do
        label 'Назва:'
      end
      field :logo, :paperclip do
        label 'Логотип:'
        help 'Логотипи вантажити лише в форматі svg 200x200 pixels'
      end
      field :position do
        label 'Порядковий номер:'
        help 'Якщо бажаєте змінити порядковий номер...'
      end
    end

  end
end
