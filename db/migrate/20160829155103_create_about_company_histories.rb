class CreateAboutCompanyHistories < ActiveRecord::Migration
  def change
    create_table :about_company_histories do |t|
      t.integer :year
      t.string :title
      t.text :description
      t.boolean :published
      t.integer :position

      t.timestamps null: false
    end
  end
end
