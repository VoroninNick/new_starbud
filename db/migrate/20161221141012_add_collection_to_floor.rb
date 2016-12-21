class AddCollectionToFloor < ActiveRecord::Migration
  def change
    change_table :catalog_floor_floors do |t|
      t.belongs_to :catalog_floor_collection
    end
  end
end
