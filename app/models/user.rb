# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# t.string :user_name
# t.attachment :avatar
# t.string :company
# t.string :phone_number
# t.text :address
# t.string :one_c_id

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_price(:user)

  attr_accessible *attribute_names, :password, :password_confirmation, :avatar
  has_attached_file :avatar,
                    styles: { thumb: "80x80>",
                              medium: "120x120>",
                              large: "240x240>"},
                    convert_options: { thumb: "-quality 94 -interlace Plane",
                                       medium: "-quality 94 -interlace Plane",
                                       large: "-quality 94 -interlace Plane"},
                    default_url: "/missing_user_:style.jpg"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # def superadmin_role?
  #   self.has_role? :superadmin_role
  # end
  # def supervisor_role?
  #   self.has_role? :supervisor_role
  # end
  # def client_role?
  #   self.has_role? :client_role
  # end

  rails_admin do
    navigation_label 'Користувачі'

    label 'Користувач'
    label_plural 'Користувачі'

    list do

    end

    edit do
      field :one_c_id do
        label "Ідентифікатор з 1С:"
      end
      field :user_name do
        label "Ім'я:"
      end
      field :company do
        label "Компанія:"
      end
      field :email do
        label "Електронна скринька:"
      end
      field :password do
        label "Пароль:"
        help "не менше 8 символів"
      end
      field :password_confirmation do
        label "Повторно пароль:"
      end
      field :phone_number do
        label "Номер телефону:"
      end
      field :address do
        label "Адреса:"
      end
      # field :published do
      #   label 'Чи публікувати?'
      # end
      # field :name do
      #   label 'Назва:'
      # end
      # field :logo, :paperclip do
      #   label 'Логотип:'
      #   help 'Логотипи вантажити лише в форматі svg 200x200 pixels'
      # end
      # field :position do
      #   label 'Порядковий номер:'
      #   help 'Якщо бажаєте змінити порядковий номер...'
      # end
    end

  end
end
