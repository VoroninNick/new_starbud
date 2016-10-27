class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :product_id
      t.string :product_type
      t.belongs_to :user

      t.string :currency
      t.float :price

      t.timestamps null: false
    end

    add_index :prices, [:product_id, :product_type, :user_id, :currency], unique: true, name: "prices_unique_columns"
  end
end
