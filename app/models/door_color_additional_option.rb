# == Schema Information
#
# Table name: door_color_additional_options
#
#  id                    :integer          not null, primary key
#  title                 :string
#  slug                  :string
#  door_variant_color_id :integer
#  canvas_size           :string
#  box                   :string
#  welt                  :string
#  price                 :string
#  price_minimal         :string
#  price_group_first     :string
#  price_group_second    :string
#  currency              :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

# t.string :title
# t.string :slug
# t.belongs_to :door_variant_color
#
# t.string :canvas_size
# t.string :box
# t.string :welt
#
# t.string :price
# t.string :price_minimal
# t.string :price_group_first
# t.string :price_group_second
#
# t.string :currency
class DoorColorAdditionalOption < ActiveRecord::Base
  attr_accessible *attribute_names

  extend Enumerize
  # attr_accessor :decor, :kapinos, :type, :material, :type_of_surface
  enumerize :currency, in: [:'uah', :'usd', :'eur']

  belongs_to :door_variant_color

  validates :canvas_size, :presence => true
  validates :box, :presence => true

  def generated_name
    "#{canvas_size} #{box}"
  end
  def save_name
    self.title = generated_name
  end
  def to_slug
    "#{generated_name.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug, :save_name

  rails_admin do
    visible false

    list do
    end

    edit do
      # field :title do
      #   label 'Назва:'
      # end
      field :canvas_size do
        label 'Розмір полотна:'
      end
      field :box do
        label 'Коробка:'
      end
      field :welt do
        label 'Лиштва:'
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


# 24+24+32+3+4+18+24+35+23+1+6+8+8+3=215*8= 1720

#
#
# class InnerDoor
#   extend ProductUpdater
#
#   def self.target_class
#     Покриття
#   end
# end
#
# module ProductUpdater
#   def update_products
#     ids = 1c_ids
#     self.target_class.where(ic_id: ids)
#   end
# end