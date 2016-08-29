# t.string :title
# t.string :slug
# t.text :short_description
# t.text :body
# t.has_attached_file :image
# t.boolean :published
# t.date :date_begin
# t.date :date_finish

class Promotion < ActiveRecord::Base

  attr_accessible *attribute_names
  attr_accessible :image
  has_attached_file :image,
                    styles: { thumb: "1000x605>",
                              large: "1920x500>"},
                    convert_options: { thumb: "-quality 94 -interlace Plane",
                                       large: "-quality 94 -interlace Plane"},
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def to_slug
    "#{title.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug

  rails_admin do
    navigation_label 'Акції'

    label 'Акція'
    label_plural 'Акції'

    list do
    end

    edit do
      field :published do
        label 'Чи публікувати?'
        help 'Ставимо галочку якщо акція не має визначений часових меж'
      end
      field :date_begin do
        label 'Дата початку:'
        help 'Заповнюємо якщо акція має час проведення'
      end
      field :date_finish do
        label 'Дата завершення:'
        help 'Заповнюємо якщо акція має час проведення'
      end
      field :title do
        label 'Назва:'
      end
      field :image, :paperclip do
        label 'Зображення:'
        help 'Зображення вантажити лише в форматі jpg 1920x500 pixels'
      end
      field :short_description do
        label 'Короткий опис:'
      end
      field :body, :ck_editor do
        label 'Тіло акції:'
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
