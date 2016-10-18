class AddReferenceToDoorOnCollection < ActiveRecord::Migration
  def change
    change_table :doors do |t|
      t.belongs_to :door_collection
    end
  end
end
