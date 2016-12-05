class CreateCatalogDoorExteriorDoorVariants < ActiveRecord::Migration
  def change
    create_table :catalog_door_exterior_door_variants do |t|
      t.integer :width
      t.integer :height
      t.string :segment
      t.string :coating_type
      t.string :opening_side

      t.belongs_to :exterior_door_color

      t.string :one_c_id

      t.string :price
      t.string :price_minimal
      t.string :price_group_first
      t.string :price_group_second
      t.string :currency

      t.timestamps null: false
    end
  end
end
