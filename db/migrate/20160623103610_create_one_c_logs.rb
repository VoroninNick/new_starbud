class CreateOneCLogs < ActiveRecord::Migration
  def change
    create_table :one_c_logs do |t|
      t.text :request_headers
      t.text :request_params
      t.text :request_body
      t.string :request_url

      t.timestamps null: false
    end
  end
end
