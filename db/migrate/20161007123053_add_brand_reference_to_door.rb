class AddBrandReferenceToDoor < ActiveRecord::Migration
  def change
    change_table :doors do |t|
      t.belongs_to :brand
    end
  end
end
