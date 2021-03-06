# == Schema Information
#
# Table name: promotions
#
#  id                     :integer          not null, primary key
#  title                  :string
#  slug                   :string
#  short_description      :text
#  body                   :text
#  image_file_name        :string
#  image_content_type     :string
#  image_file_size        :integer
#  image_updated_at       :datetime
#  published              :boolean
#  date_begin             :date
#  date_finish            :date
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  right_order            :boolean
#  white_style            :boolean
#  thumbnail_file_name    :string
#  thumbnail_content_type :string
#  thumbnail_file_size    :integer
#  thumbnail_updated_at   :datetime
#

# t.string :title
# t.string :slug
# t.text :short_description
# t.text :body
# t.has_attached_file :image
# t.has_attached_file :thumbnail
# t.boolean :published
# t.date :date_begin
# t.date :date_finish
# t.boolean :right_order
# t.boolean :white_style

class Promotion < ActiveRecord::Base

  attr_accessible *attribute_names
  attr_accessible :image, :thumbnail
  has_attached_file :image,
                    styles: { large: "1920x500>"},
                    convert_options: { large: "-quality 94 -interlace Plane"},
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_attached_file :thumbnail,
                    styles: { large: "1170x605>"},
                    convert_options: { large: "-quality 94 -interlace Plane"},
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/

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
        label 'Зображення на банер:'
        help 'Зображення вантажити лише в форматі jpg 1920x500 pixels'
      end
      field :thumbnail, :paperclip do
        label 'Зображення тумбочка:'
        help 'Зображення вантажити лише в форматі jpg 1170x605 pixels'
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
    Promotion.active_or_published.where("id > ?", id).first
  end

  def prev
    Promotion.active_or_published.where("id < ?", id).last
  end
end
