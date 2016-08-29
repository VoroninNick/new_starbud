class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :title
      t.string :slug
      t.text :short_description
      t.text :body
      t.has_attached_file :image
      t.boolean :published
      t.date :date_begin
      t.date :date_finish

      t.timestamps null: false
    end
  end
end
