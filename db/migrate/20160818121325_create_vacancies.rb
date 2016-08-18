class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :title
      t.string :slug
      t.string :city
      t.text :description
      t.boolean :published
      t.integer :position

      t.timestamps null: false
    end
  end
end
