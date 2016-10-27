module PriceMethods
  module ClassMethods
    def has_price(as = :product)

      if as == :user
        has_many :prices
        [DoorVariant].each do |c|
          singular_name = c.name.underscore
          plural_name = singular_name.pluralize
          has_many plural_name.to_sym, through: :prices, source: :product, source_type: c
          self.send :include, PriceMethods::User::InstanceMethods
        end


      else
        has_many :prices, as: as
        has_many :price_users, through: :prices, source: :user
        self.send :include, PriceMethods::Product::InstanceMethods
      end
    end
  end

  module Product
    module InstanceMethods
      def price_for_user(user)
        if user.blank?
          return nil
        end

        user_id = user
        if user.respond_to?(:id)
          user_id = user.id
        end
        prices.where(user_id: user_id).first.try(:price)
      end
    end
  end

  module User
    module InstanceMethods
      def price_products

      end

      def price_for_product(product)
        if product.blank?
          return nil
        end

        prices.where(product_id: product.id, product_type: product.class.name).first.try(:price)
      end
    end
  end


end

ActiveRecord::Base.send(:extend, PriceMethods::ClassMethods)