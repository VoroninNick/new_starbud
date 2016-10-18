# t.belongs_to :door
# t.string :name_color
# t.attachment :icon
# t.attachment :image
# t.string :slug
# t.integer :canvas_size

# t.string :price
# t.string :price_minimal
# t.string :price_group_first
# t.string :price_group_second
# t.string :currency

# t.boolean :promotion
# t.boolean :new
# t.boolean :recommended

def canvas_size_enum_field
  field :canvas_size, :enum do
    enum_method :available_sizes
    label 'Розмір полотна:'
    help do
     unless @bindings[:object].persisted?
       "Спочатку збережіть одиницю для можливості встановити розмір полотна"
     else
       "Виберіть розмір полотна"
     end

    end

    visible do
      true
    end
  end
end

class DoorVariant < ActiveRecord::Base
  attr_accessible *attribute_names

  extend Enumerize
  enumerize :currency, in: [:'uah', :'usd', :'eur']

  belongs_to :door
  has_one :door_collection, through: :door
  has_one :door_producer, through: :door_collection

  attr_accessible :image, :icon

  has_attached_file :icon,
                    styles: { large: "240x240>"},
                    convert_options: { large: "-quality 94 -interlace Plane"},
                    default_url: "/images/:style/missing.png"

  has_attached_file :image,
                    styles: { large: "300x600>"},
                    convert_options: { large: "-quality 94 -interlace Plane"},
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :name_color, :presence => true
  validates :canvas_size, :presence => true, if: -> { persisted? }

  def to_parameterize
    "#{name_color.parameterize}"
  end
  def create_slug
    "#{to_parameterize} #{canvas_size}"
  end

  def save_slug
    self.slug = create_slug
  end
  before_save :save_slug

  rails_admin do
    visible false

    label 'Варіант дверей'
    label_plural 'Варіанти дверей'
    object_label_method :slug

    list do
      field :slug do
        label 'назва'
      end
      field :image
    end

    edit do
      field :door
      canvas_size_enum_field
      field :name_color do
        label 'Назва кольору:'
      end
      field :icon, :paperclip do
        label 'Іконка:'
        help 'Зображення вантажити лише в форматі jpg 80x80 pixels'
      end
      field :image, :paperclip do
        label 'Зображення:'
        help 'Зображення вантажити лише в форматі jpg 300x700 pixels'
      end

      field :promotion do
        label 'Акційні?'
      end
      field :new do
        label 'Нові?'
      end
      field :recommended do
        label 'Рекомендуємо?'
        help 'для відображення на головній сторінці.'
      end

      group :prices do
        label 'Ціна'
        active true

        field :currency, :enum do
          label 'Валюта:'
        end

        field :price_minimal do
          label 'Мінімальна:'
        end
        field :price_group_first do
          label 'Гурт 1:'
        end
        field :price_group_second do
          label 'Гурт 2:'
        end
        field :price do
          label 'Прайс:'
        end

      end

    end

    nested do
      field :door do
        visible false
      end
      canvas_size_enum_field
      field :name_color do
        label 'Назва кольору:'
      end
      field :icon, :paperclip do
        label 'Іконка:'
        help 'Зображення вантажити лише в форматі jpg 80x80 pixels'
      end
      field :image, :paperclip do
        label 'Зображення:'
        help 'Зображення вантажити лише в форматі jpg 300x700 pixels'
      end
    end

  end

  def available_sizes
    if (door_producer rescue false)
      door_producer.door_canvas_sizes.pluck(:name)
    else
      []
    end
  end

  def current_price
    if price.present?
      price
    elsif price_minimal.present?
      price_minimal
    elsif price_group_first.present?
      price_group_first
    elsif price_group_second.present?
      price_group_second
    end
  end

  def current_currency
    if currency == 'uah'
      # t("enumerize.currency.#{currency}")
      'грн.'
    elsif currency == 'usd'
      # t("enumerize.currency.#{currency}")
      'дол.'
    elsif currency == 'eur'
      # t("enumerize.currency.#{currency}")
      'євро'
    end
  end


end
