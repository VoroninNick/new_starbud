# == Schema Information
#
# Table name: door_variant_welts
#
#  id                 :integer          not null, primary key
#  name               :string
#  slug               :string
#  one_c_id           :string
#  price              :string
#  price_minimal      :string
#  price_group_first  :string
#  price_group_second :string
#  currency           :string
#  door_color_id      :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class DoorVariantWelt < ActiveRecord::Base
  attr_accessible *attribute_names

  extend Enumerize
  enumerize :currency, in: [:'uah', :'usd', :'eur']
  belongs_to :door_color

  def to_slug
    "#{name.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug

  rails_admin do
    visible false

    list do
      field :one_c_id do
        label 'Ідентифікатор з 1С'
      end
      field :slug do
        label 'назва'
      end
    end

    edit do
      field :name do
        label 'Найменування:'
      end
      field :one_c_id do
        label 'Ідентифікатор з 1С'
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
  end
end
