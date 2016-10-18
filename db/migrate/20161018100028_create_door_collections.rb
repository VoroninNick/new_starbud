class CreateDoorCollections < ActiveRecord::Migration
  def change
    create_table :door_collections do |t|
      t.string :title
      t.string :slug
      t.belongs_to :door_producer

      t.timestamps null: false
    end
  end
end
