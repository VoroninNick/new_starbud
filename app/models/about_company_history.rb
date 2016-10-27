# == Schema Information
#
# Table name: about_company_histories
#
#  id          :integer          not null, primary key
#  year        :integer
#  title       :string
#  description :text
#  published   :boolean
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# t.integer :year
# t.string :title
# t.text :description
# t.boolean :published
# t.integer :position

class AboutCompanyHistory < ActiveRecord::Base
  attr_accessible *attribute_names


  rails_admin do
    navigation_label 'Про нас'

    label 'Історія компанії'
    label_plural 'Історія компанії'

    list do
    end

    edit do
      field :published do
        label 'Чи публікувати?'
      end
      field :position do
        label 'Позиція:'
        help 'за якою буде відсортовано'
      end

      field :year do
        label 'Рік:'
      end
      field :title do
        label "Заголовок:"
      end
      field :description do
        label 'Опис:'
      end
    end
  end

  scope :published, -> { where(:published => true).order('position asc')}
end
