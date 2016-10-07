class ChangeColumnNameTypeToProductType < ActiveRecord::Migration
  def change
    rename_column :doors, :type, :product_type
  end
end
