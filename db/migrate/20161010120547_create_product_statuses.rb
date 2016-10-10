class CreateProductStatuses < ActiveRecord::Migration
  def change
    create_table :product_statuses do |t|
      t.string :product_id
      t.string :name
      t.boolean :status
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
