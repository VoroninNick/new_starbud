# t.string :title
# t.string :slug
# t.text :short_description
# t.text :body
# t.has_attached_file :image
# t.boolean :published
# t.date :date_begin
# t.date :date_finish
# t.boolean :right_order
# t.boolean :white_style

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
      group :char_external do
        label 'Стилі відображення'
        active true

        field :right_order do
          label 'Права сторона вирівнювання (на сторінці всі акції):'
          help 'По замовчуванню тексти на сторінці всі акції вирівнюється по ліву сторону...'
        end
        field :white_style do
          label 'Білий колір текстів (на сторінці всі акції):'
          help 'По замовчуванню тексти на сторінці всі акції темного кольору...'
        end
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

  # scope :def_published, -> { where(:published => true).order('created_at asc')}
  scope :activeDate, -> { where("? BETWEEN date_begin AND date_finish", Date.today)}
  # scope :published, -> { :def_published.where.not(:featured => true)}

  scope :active_or_published, -> { where("(? BETWEEN date_begin AND date_finish) OR published = 't'", Date.today).order('created_at desc') }

  def next
    Publication.def_published.where("id > ?", id).first
  end

  def prev
    Publication.def_published.where("id < ?", id).last
  end
end
