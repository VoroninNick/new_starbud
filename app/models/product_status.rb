# t.string :product_id
# t.string :name
# t.boolean :status
# t.integer :quantity
class ProductStatus < ActiveRecord::Base

  rails_admin do
    navigation_label 'Синхронізація з 1С'

    label 'Статистика по залишках'
    label_plural 'Статистика по залишках'

    list do
      field :product_id do
        label 'Артикул продута:'
      end
      field :name do
        label 'Назва продута:'
      end
      field :status do
        label 'Статус наявності:'
      end
      field :quantity do
        label 'Кількість:'
      end
    end
  end
end
