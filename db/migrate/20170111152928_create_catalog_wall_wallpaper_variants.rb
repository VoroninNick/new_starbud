class CreateCatalogWallWallpaperVariants < ActiveRecord::Migration
  def change
    create_table :catalog_wall_wallpaper_variants do |t|
      t.string :name
      t.string :slug
      t.attachment :icon
      t.attachment :avatar

      t.belongs_to :catalog_wall_wallpaper

      t.integer :amount_pack
      t.integer :available_amount

      t.string :one_c_id

      t.string :price
      t.string :price_minimal
      t.string :price_group_first
      t.string :price_group_second
      t.string :currency

      t.timestamps null: false
    end
  end
end
