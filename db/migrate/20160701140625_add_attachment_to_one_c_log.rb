class AddAttachmentToOneCLog < ActiveRecord::Migration
  def change
    change_table :one_c_logs do |t|
      t.attachment :attachment_file
    end
  end
end
