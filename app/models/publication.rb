# t.string :title
# t.string :slug
# t.has_attached_file :photo
# t.text :body
# t.boolean :published
# t.boolean :featured

class Publication < ActiveRecord::Base
  acts_as_taggable
  # acts_as_taggable_on :skills, :interests


  attr_accessible *attribute_names
  attr_accessible :photo, :tag_list
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
      field :tag_list do
        label "Категорії:"
        help 'Якщо це новий тег, то вводимо його назву. А якщо існуючий то вибираємо з боку з існуючих...'
        partial 'tag_list_with_suggestions'
        # ratl_max_suggestions -1
      end
      field :photo, :paperclip do
        label 'Логотип:'
        help 'Логотипи вантажити лише в форматі jpg 1920x500 pixels'
      end
      field :body, :ck_editor do
        label 'Тіло публікації:'
        help 'Використовувати теги h3, h4, h5, h6, p, цитата: <blockquote><p></p><footer></footer></blockquote>, списки: <ul or ol> <li> <span>text</span></li></ul or /ol>, картинка з підписом: <figure><img>
              <figcaption>підпис</figcaption>
              </figure>'
      end
    end

  end

  scope :def_published, -> { where(:published => true).order('created_at asc')}
  scope :published, -> { :def_published.where.not(:featured => true)}
  scope :featured, -> { where(:published => true).where(:featured => true).order('created_at asc')}

  def next
    Publication.def_published.where("id > ?", id).first
  end

  def prev
    Publication.def_published.where("id < ?", id).last
  end
end
