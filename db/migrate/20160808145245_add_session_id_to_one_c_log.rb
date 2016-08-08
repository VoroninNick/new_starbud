class AddSessionIdToOneCLog < ActiveRecord::Migration
  def change
    add_column :one_c_logs, :session_id, :string
  end
end
