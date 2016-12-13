# t.integer :productable_id
# t.string :productable_type
# t.text :short_description
# t.text :specification
# t.text :attention
# t.text :warranty

class ProductAdditionOption < ActiveRecord::Base
  attr_accessible *attribute_names
  belongs_to :productable, polymorphic: true

  rails_admin do
    visible false

    list do
      field :id
      field :floor_type
      field :full_name
      field :full_slug
      field :one_c_id
    end

    edit do
      field :short_description do
        html_attributes rows: 10, cols: 100
        label 'Короткий опис:'
      end
      field :specification, :ck_editor do
        label 'Характеристики:'
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
