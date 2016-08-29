class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.boolean :published
      t.integer :position

      t.timestamps null: false
    end
  end
end
