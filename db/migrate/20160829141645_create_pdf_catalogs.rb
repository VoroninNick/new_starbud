class CreatePdfCatalogs < ActiveRecord::Migration
  def change
    create_table :pdf_catalogs do |t|
      t.has_attached_file :catalog

      t.timestamps null: false
    end
  end
end
