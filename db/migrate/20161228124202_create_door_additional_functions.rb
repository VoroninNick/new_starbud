class CreateDoorAdditionalFunctions < ActiveRecord::Migration
  def change
    create_table :door_additional_functions do |t|
      t.string :name
      t.string :slug
      t.string :key


      t.string :one_c_id

      t.timestamps null: false
    end
  end
end
