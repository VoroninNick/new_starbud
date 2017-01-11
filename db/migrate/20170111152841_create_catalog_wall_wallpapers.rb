class CreateCatalogWallWallpapers < ActiveRecord::Migration
  def change
    create_table :catalog_wall_wallpapers do |t|
      t.string :name
      t.text :short_description
      t.belongs_to :catalog_wall_producer
      t.attachment :image

      t.timestamps null: false
    end
  end
end
