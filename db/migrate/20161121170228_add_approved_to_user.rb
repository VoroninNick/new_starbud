class AddApprovedToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.boolean :approved, :default => false, :null => false
    end
    add_index  :users, :approved
  end
end
