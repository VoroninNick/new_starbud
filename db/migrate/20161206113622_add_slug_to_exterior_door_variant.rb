class AddSlugToExteriorDoorVariant < ActiveRecord::Migration
  def change
    change_table :catalog_door_exterior_door_variants do |t|
      t.string :full_slug
      t.string :full_name
    end
  end
end
