class CreateCatalogDoorExteriorDoorColors < ActiveRecord::Migration
  def change
    create_table :catalog_door_exterior_door_colors do |t|
      t.string :name
      t.string :slug
      t.attachment :icon
      t.belongs_to :exterior_door

      t.timestamps null: false
    end
  end
end
