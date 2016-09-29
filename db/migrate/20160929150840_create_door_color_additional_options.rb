class CreateDoorColorAdditionalOptions < ActiveRecord::Migration
  def change
    create_table :door_color_additional_options do |t|
      t.string :title
      t.string :slug
      t.belongs_to :door_variant_color

      t.string :canvas_size
      t.string :box
      t.string :welt

      t.string :price
      t.string :price_minimal
      t.string :price_group_first
      t.string :price_group_second

      t.string :currency

      t.timestamps null: false
    end
  end
end
