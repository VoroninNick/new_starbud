class CreateCatalogWallProducers < ActiveRecord::Migration
  def change
    create_table :catalog_wall_producers do |t|
      t.string :name
      t.string :slug
      t.string :country

      t.timestamps null: false
    end
  end
end
