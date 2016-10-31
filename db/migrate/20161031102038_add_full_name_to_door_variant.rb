class AddFullNameToDoorVariant < ActiveRecord::Migration
  def change
    change_table :door_variants do |t|
      t.string :full_name
      t.string :full_slug
    end
  end
end
