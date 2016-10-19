class AddDoorColorReferenceToDoorVariant < ActiveRecord::Migration
  def change
    change_table :door_variants do |t|
      t.belongs_to :door_color
    end
  end
end
