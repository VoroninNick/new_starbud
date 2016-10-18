class AddPricesToVariantDoor < ActiveRecord::Migration
  def change
    change_table :door_variants do |t|
      t.string :price
      t.string :price_minimal
      t.string :price_group_first
      t.string :price_group_second

      t.string :currency
    end
  end
end
