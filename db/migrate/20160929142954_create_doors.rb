class CreateDoors < ActiveRecord::Migration
  def change
    create_table :doors do |t|
      t.string :title
      t.string :slug
      t.string :brand
      t.text :description
      t.string :type

      t.timestamps null: false
    end
  end
end
