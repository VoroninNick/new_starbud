class AddFieldStylesToPromotion < ActiveRecord::Migration
  def change
    change_table :promotions do |t|
      t.boolean :right_order
      t.boolean :white_style

    end
  end
end
