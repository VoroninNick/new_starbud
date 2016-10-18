class CreateDoorProducers < ActiveRecord::Migration
  def change
    create_table :door_producers do |t|
      t.string :title
      t.string :slug
      t.string :country

      t.timestamps null: false
    end
  end
end
