class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.string :slug
      t.has_attached_file :photo
      t.text :body
      t.boolean :published
      t.boolean :featured

      t.timestamps null: false
    end
  end
end
