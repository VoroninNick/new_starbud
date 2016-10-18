


# Вхідні
# -- виробники

# -- ширина: 86, 96, 120

# -- товщина: від 52 до 75

# -- тип: метал, мдф накладка,
# -- тип покриття:
# --- тип плівки: вулична, квартирна
# --- колір: набір кольорів (робимо стандартизацію) опцій но автомазацію
# --- тип металу:
# -- елементи декодування: глухі, скло та ковнина
# -- утеплення: мінвата, пінопласт, відсутне
#
# Міжкімнатні
# -- виробники
# -- ширина: 60, 70, 80, 90
# -- тип покриття: шмон, масив, мдф, пвх, емаль
# -- колір: набір кольорів (стандартизуємо кольори)
# -- елементи декорування: глухі, з шклом, з молдингом, патиновані, фотодрук
# -- тип відкривання: гармошнка, стандартна
#
# - фурнітура
# - вид: ручки, петлі, міжкімнатні механізми, комплектуючі.
# -- тип покриття: срібло, золото, бронза, емаль





# t.string :title
# t.string :slug
# t.string :brand
# t.text :description
# t.string :type


# t.text :specification
# t.text :attention
# t.text :warranty

# rename_column :doors, :brand, :brand_string
# t.belongs_to :brand
# rename_column :doors, :type, :product_type

# t.belongs_to :door_collection

class Door < ActiveRecord::Base
  # acts_as_taggable_on :brands

  attr_accessible *attribute_names

  extend Enumerize
  enumerize :product_type, in: [:'the_entrance', :'interior']

  belongs_to :door_collection


  has_many :door_variants
  attr_accessible :door_variants
  accepts_nested_attributes_for :door_variants, allow_destroy: true
  attr_accessible :door_variants_attributes


  # validates :product_type, :presence => true


  def to_slug
    "#{title.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug


  rails_admin do
    navigation_label 'Каталог'

    label 'Двері'
    label_plural 'Двері'

    list do
      field :title
      field :door_collection
      field :product_type
      field :description
    end

    edit do
      field :title do
        label 'Назва:'
      end
      field :product_type do
        label 'Вид дверей:'
      end
      field :door_collection_id, :enum do
        enum do
          DoorCollection.includes(:door_producer).all.map { |i| [i.door_producer.title + ', ' + i.title, i.id] }

        end
        label "Колекція:"
      end
      field :description do
        html_attributes rows: 10, cols: 100
        label 'Короткий опис:'
      end

      field :door_variants do
        label 'Варіанти дверей:'
      end
      group :specification do
        label 'Додаткові опції'
        active false

        field :specification, :ck_editor do
          label 'Технічні характеристики:'
        end
        field :attention, :ck_editor do
          label 'Догляд:'
        end
        field :warranty, :ck_editor do
          label 'Умови гарантії:'
        end
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

  def available_colors
    self.door_variants.uniq
  end
end
