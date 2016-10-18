class CreateDoorVariants < ActiveRecord::Migration
  def change
    create_table :door_variants do |t|
      t.belongs_to :door
      t.string :name_color
      t.attachment :icon
      t.attachment :image
      t.string :slug
      t.integer :canvas_size

      t.timestamps null: false
    end
  end
end
