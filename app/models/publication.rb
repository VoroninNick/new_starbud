# t.string :title
# t.string :slug
# t.has_attached_file :photo
# t.text :body
# t.boolean :published
# t.boolean :featured

class Publication < ActiveRecord::Base
  attr_accessible *attribute_names
  attr_accessible :photo
  has_attached_file :photo,
                    styles: { thumb: "500x500>",
                              large: "1920x500>"},
                    convert_options: { thumb: "-quality 94 -interlace Plane",
                                       large: "-quality 94 -interlace Plane"},
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  def to_slug
    "#{title.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug

  rails_admin do
    navigation_label 'Публікації'

    label 'Публікація'
    label_plural 'Публікації'

    list do
    end

    edit do
      field :published do
        label 'Чи публікувати?'
      end
      field :featured do
        label 'Чи особлива?'
        help 'Публікації які будуть відображатись на банері сторінки всіх публікацій...'
      end
      field :title do
        label 'Назва:'
      end
      field :photo, :paperclip do
        label 'Логотип:'
        help 'Логотипи вантажити лише в форматі jpg 1920x500 pixels'
      end
      field :body, :ck_editor do
        label 'Тіло публікації:'
        help 'Використовувати теги h3, h4, h5, h6, p, blockquote, <ul or ol> <li> <span>text</span></li></ul or /ol>'
      end
    end

  end

  scope :published, -> { where(:published => true).where.not(:featured => true).order('created_at asc')}
  scope :featured, -> { where(:published => true).where(:featured => true).order('created_at asc')}

end
