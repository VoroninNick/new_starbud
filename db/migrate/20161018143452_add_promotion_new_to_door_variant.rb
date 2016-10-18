class AddPromotionNewToDoorVariant < ActiveRecord::Migration
  def change
    change_table :door_variants do |t|
      t.boolean :promotion
      t.boolean :new
      t.boolean :recommended

    end
  end
end
