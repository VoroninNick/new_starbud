class AddReferenceToExteriorDoorOnCollection < ActiveRecord::Migration
  def change
    change_table :catalog_door_exterior_doors do |t|
      t.belongs_to :door_collection
    end
  end
end
