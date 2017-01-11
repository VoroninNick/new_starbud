class AddSlugToWallpaper < ActiveRecord::Migration
  def change
    change_table :catalog_wall_wallpapers do |t|
      t.string :slug
    end
  end
end
