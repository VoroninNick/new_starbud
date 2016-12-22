class AddAvailableAmountToDoorVariant < ActiveRecord::Migration
  def change
    change_table :door_variants do |t|
      t.integer :available_amount
    end
  end
end
