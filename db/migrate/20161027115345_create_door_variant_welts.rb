class CreateDoorVariantWelts < ActiveRecord::Migration
  def change
    create_table :door_variant_welts do |t|
      t.string :name
      t.string :slug
      t.string :one_c_id

      t.string :price
      t.string :price_minimal
      t.string :price_group_first
      t.string :price_group_second
      t.string :currency

      t.belongs_to :door_color

      t.timestamps null: false
    end
  end
end
