# t.string :title
# t.integer :position
# t.boolean :published
# t.has_attached_file :image

class OurCertificate < ActiveRecord::Base

  attr_accessible *attribute_names
  attr_accessible :image
  has_attached_file :image,
                    styles: { thumb: "104x156>",
                              large: "594x840>"},
                    convert_options: { thumb: "-quality 94 -interlace Plane",
                                       large: "-quality 94 -interlace Plane"},
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  rails_admin do
    navigation_label 'Наші сертифікати'

    label 'Сертифікат'
    label_plural 'Сертифікати'

    list do

    end

    edit do
      field :published do
        label 'Чи публікувати?'
      end
      field :title do
        label 'Назва:'
      end
      field :image, :paperclip do
        label 'Логотип:'
        help 'Логотипи вантажити лише в форматі svg 200x200 pixels'
      end
      field :position do
        label 'Порядковий номер:'
        help 'Якщо бажаєте змінити порядковий номер...'
      end
    end

  end

  scope :with_public, -> { where(:published => true).order('created_at asc')}
end
