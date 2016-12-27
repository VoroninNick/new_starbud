class CreateCatalogFloorCollectionCharacteristics < ActiveRecord::Migration
  def change
    create_table :catalog_floor_collection_characteristics do |t|
      t.string :key
      t.string :key_slug

      t.string :value
      t.string :value_slug

      t.attachment :avatar

      t.belongs_to :catalog_floor_collection

      t.timestamps null: false
    end
  end
end
