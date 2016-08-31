class AddThumbnailToPromotion < ActiveRecord::Migration
  def change
    change_table :promotions do |t|
      t.has_attached_file :thumbnail
    end
  end
end
