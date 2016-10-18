class CreateDoorCanvasSizes < ActiveRecord::Migration
  def change
    create_table :door_canvas_sizes do |t|
      t.belongs_to :door_producer
      t.integer :name

      t.timestamps null: false
    end
  end
end
