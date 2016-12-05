class CreateCatalogDoorExteriorDoors < ActiveRecord::Migration
  def change
    create_table :catalog_door_exterior_doors do |t|
      t.string :title
      t.string :slug
      t.string :brand
      t.attachment :image
      t.text :description

      t.text :specification
      t.text :attention
      t.text :warranty

      t.timestamps null: false
    end
  end
end
