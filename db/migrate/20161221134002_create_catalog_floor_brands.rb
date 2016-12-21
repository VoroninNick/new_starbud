class CreateCatalogFloorBrands < ActiveRecord::Migration
  def change
    create_table :catalog_floor_brands do |t|
      t.string :name
      t.string :country
      t.string :slug

      t.timestamps null: false
    end
  end
end
