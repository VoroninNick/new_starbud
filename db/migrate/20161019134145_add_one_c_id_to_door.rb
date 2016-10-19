class AddOneCIdToDoor < ActiveRecord::Migration
  def change
    change_table :door_variants do |t|
      t.string :one_c_id
    end
  end
end
