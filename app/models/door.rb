# == Schema Information
#
# Table name: doors
#
#  id                 :integer          not null, primary key
#  title              :string
#  slug               :string
#  brand_string       :string
#  description        :text
#  product_type       :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  specification      :text
#  attention          :text
#  warranty           :text
#  brand_id           :integer
#  door_collection_id :integer
#




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
  # acts_as_commentable

  attr_accessible *attribute_names

  extend Enumerize
  enumerize :product_type, in: [:'the_entrance', :'interior']

  belongs_to :door_collection
  has_one :door_producer, through: :door_collection


  has_many :door_colors
  attr_accessible :door_colors
  accepts_nested_attributes_for :door_colors, allow_destroy: true
  attr_accessible :door_colors_attributes



  def to_slug
    "#{title.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug


  rails_admin do
    navigation_label 'Каталог'

    label 'Двері міжкімнатні'
    label_plural 'Двері міжкімнатні'

    list do
      # field :product_type
      field :title
      field :door_producer
      field :door_collection
      field :description
    end

    edit do
      field :title do
        label 'Назва:'
      end
      # field :product_type do
      #   label 'Вид дверей:'
      # end
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

      field :door_colors do
        label 'Кольори дверей:'
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

  # def available_sizes
  #   if (door_producer rescue false)
  #     door_producer.door_canvas_sizes.pluck(:name)
  #   else
  #     []
  #   end
  #
  # end

  scope :with_recommended_variant, -> () {
    joins(door_colors: { door_variants: {} }).where(door_variants: { recommended: "t" }).uniq
  }
  scope :with_news_variant, -> () {
    with_recommended_variant.where(door_variants: { new: "t" })
  }
  scope :with_promotion_variant, -> () {
    with_recommended_variant.where(door_variants: { promotion: "t" })
  }
  def available_colors
    self.door_colors.uniq
  end

  paginates_per 12

  filterrific(
      default_filter_params: { sorted_by: 'title_desc' },
      available_filters: [
          :sorted_by,
          :with_product_type
      ]
  )



#   sorted by
  scope :sorted_by, lambda { |sort_key|
    direction = (sort_key =~ /desc$/) ? 'desc' : 'asc'
    case sort_key.to_s
      when /^title_/
        order("doors.title #{ direction }")
      else
        raise(ArgumentError, "Invalid sort option: #{ sort_key.inspect }")
    end
  }
  def self.options_for_sorted_by
    [
        ['Сортувати за алфавітом: нові', 'title_desc'],
        ['Сортувати за алфавітом: старі', 'title_asc']
    ]
  end

  #  product_type
  scope :with_product_type, lambda { |value|
    where(product_type: [value])
  }
end
