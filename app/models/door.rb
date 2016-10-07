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

class Door < ActiveRecord::Base
  # acts_as_taggable_on :brands

  attr_accessible *attribute_names

  extend Enumerize
  enumerize :product_type, in: [:'the_entrance', :'interior']

  belongs_to :brand
  attr_accessible :brand, :brand_id


  has_many :door_variant_colors
  attr_accessible :door_variant_colors
  accepts_nested_attributes_for :door_variant_colors, allow_destroy: true
  attr_accessible :door_variant_colors_attributes

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
      field :brand
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
      field :brand do
        label "Виробник:"
        # help ''
        # partial 'tag_list_with_suggestions'
      end
      field :description do
        html_attributes rows: 10, cols: 100
        label 'Короткий опис:'
      end

      group :specification do
        label 'Додаткові опції'
        active true

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

  def available_colors
    self.door_variant_colors.uniq
  end
end
