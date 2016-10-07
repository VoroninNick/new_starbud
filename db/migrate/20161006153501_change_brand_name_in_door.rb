class ChangeBrandNameInDoor < ActiveRecord::Migration
  def change
    rename_column :doors, :brand, :brand_string
  end
end
