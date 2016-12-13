class CreateCatalogFloorFloors < ActiveRecord::Migration
  def change
    create_table :catalog_floor_floors do |t|
      t.string :floor_type
      t.string :name
      t.string :slug
      t.string :full_name
      t.string :full_slug

      t.string :marking
      t.float :amount
      t.string :product_unit

      t.attachment :avatar

      t.attachment :perspective
      t.attachment :structure
      t.attachment :interior

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
