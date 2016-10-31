module BaseDoorVariant
  def self.included(base)
    base.send :include, BaseDoorVariant::InstanceMethods
    base.send :extend, BaseDoorVariant::ClassMethods
    base.send :extend, Enumerize


    base.attr_accessible *base.attribute_names


    base.enumerize :currency, in: [:'uah', :'usd', :'eur']
    base.belongs_to :door_color


    base.before_save :save_slug

    base.rails_admin do
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

  module InstanceMethods
    def to_slug
      "#{name.parameterize}"
    end
    def save_slug
      self.slug = to_slug
    end
  end

  module ClassMethods

  end


end