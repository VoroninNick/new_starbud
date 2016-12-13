class CreateProductAdditionOptions < ActiveRecord::Migration
  def change
    create_table :product_addition_options do |t|
      t.integer :productable_id
      t.string :productable_type
      t.text :short_description
      t.text :specification
      t.text :attention
      t.text :warranty

      t.timestamps null: false
    end
  end
end
