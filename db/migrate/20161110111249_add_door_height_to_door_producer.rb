class AddDoorHeightToDoorProducer < ActiveRecord::Migration
  def change
    change_table :door_producers do |t|
      t.integer :height
    end
  end
end
