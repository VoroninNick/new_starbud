class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :title
      t.string :slug
      t.string :country
      t.integer :brandable_id
      t.string :brandable_type

      t.timestamps null: false
    end
  end
end
