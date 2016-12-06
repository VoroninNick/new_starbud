class AddStatesToExteriorDoors < ActiveRecord::Migration
  def change
    change_table :catalog_door_exterior_door_variants do |t|
      t.boolean :promotion
      t.boolean :new
      t.boolean :recommended
    end
  end
end
