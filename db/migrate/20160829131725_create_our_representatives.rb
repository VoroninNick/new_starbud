class CreateOurRepresentatives < ActiveRecord::Migration
  def change
    create_table :our_representatives do |t|
      t.string :person
      t.string :region
      t.string :phone
      t.boolean :published
      t.integer :position
      t.has_attached_file :avatar

      t.timestamps null: false
    end
  end
end
