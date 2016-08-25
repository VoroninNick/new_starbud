class CreateOurCertificates < ActiveRecord::Migration
  def change
    create_table :our_certificates do |t|
      t.string :title
      t.integer :position
      t.boolean :published
      t.has_attached_file :image

      t.timestamps null: false
    end
  end
end
