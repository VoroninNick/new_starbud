class CreateCatalogFloorCollections < ActiveRecord::Migration
  def change
    create_table :catalog_floor_collections do |t|
      t.string :name
      t.string :slug
      t.belongs_to :catalog_floor_brand

      t.timestamps null: false
    end
  end
end
