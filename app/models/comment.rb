# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  published  :boolean
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# t.string :title
# t.text :body
# t.boolean :published
# t.integer :position

class Comment < ActiveRecord::Base

  attr_accessible *attribute_names

  rails_admin do
    navigation_label 'Головна сторінка'

    label 'Відгук'
    label_plural 'Відгуки'

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

      field :title do
        label 'Власник:'
      end
      field :body do
        label "Тіло:"
      end
    end
  end

  scope :published, -> { where(:published => true).order('position asc')}
end
