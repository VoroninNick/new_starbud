class AddIconToDoorVariantColor < ActiveRecord::Migration
  def change
    change_table :door_variant_colors do |t|
      t.attachment :icon
      t.string :slug
    end
  end
end
