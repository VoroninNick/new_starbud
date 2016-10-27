# == Schema Information
#
# Table name: our_representatives
#
#  id                  :integer          not null, primary key
#  person              :string
#  region              :string
#  phone               :string
#  published           :boolean
#  position            :integer
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

# t.string :person
# t.string :region
# t.string :phone
# t.boolean :published
# t.integer :position
# t.has_attached_file :avatar

class OurRepresentative < ActiveRecord::Base

  attr_accessible *attribute_names
  attr_accessible :avatar
  has_attached_file :avatar,
                    styles: { large: "500x500>"},
                    convert_options: { large: "-quality 94 -interlace Plane"},
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  rails_admin do
    navigation_label 'Наш персонал'

    label 'Працівник'
    label_plural 'Працівники'

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

      field :region do
        label 'Регіон:'
      end
      field :person do
        label "Ім'я працівника:"
      end
      field :phone do
        label 'Номер телефону:'
      end
      field :avatar, :paperclip do
        label 'Аватарка:'
        help 'Зображення вантажити лише в форматі jpg 500x500 pixels'
      end
    end
  end

  scope :published, -> { where(:published => true).order('position asc')}
end
