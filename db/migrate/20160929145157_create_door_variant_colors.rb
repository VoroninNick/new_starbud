class CreateDoorVariantColors < ActiveRecord::Migration
  def change
    create_table :door_variant_colors do |t|
      t.string :name
      t.attachment :image
      t.belongs_to :door

      t.timestamps null: false
    end
  end
end
