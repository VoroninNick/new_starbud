class AddPromotionNewRecommendedFieldsToDoorVariantColor < ActiveRecord::Migration
  def change
    change_table :door_variant_colors do |t|
      t.boolean :promotion
      t.boolean :new
      t.boolean :recommended
    end
  end
end
