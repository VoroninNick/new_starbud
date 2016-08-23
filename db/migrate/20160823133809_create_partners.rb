class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.has_attached_file :logo
      t.integer :position
      t.boolean :published

      t.timestamps null: false
    end
  end
end
