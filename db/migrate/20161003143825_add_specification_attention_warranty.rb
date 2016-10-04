class AddSpecificationAttentionWarranty < ActiveRecord::Migration
  def change
    change_table :doors do |t|
      t.text :specification
      t.text :attention
      t.text :warranty
    end
  end
end
