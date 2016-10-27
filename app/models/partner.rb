# == Schema Information
#
# Table name: partners
#
#  id                :integer          not null, primary key
#  name              :string
#  logo_file_name    :string
#  logo_content_type :string
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#  position          :integer
#  published         :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

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
