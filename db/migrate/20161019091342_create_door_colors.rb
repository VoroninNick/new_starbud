class CreateDoorColors < ActiveRecord::Migration
  def change
    create_table :door_colors do |t|
      t.string :name
      t.string :slug
      t.attachment :icon
      t.attachment :image
      t.belongs_to :door

      t.timestamps null: false
    end
  end
end
