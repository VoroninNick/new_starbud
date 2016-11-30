class AddColumnsToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :user_name
      t.attachment :avatar
      t.string :company
      t.string :phone_number
      t.text :address
      t.string :one_c_id

    end
  end
end
