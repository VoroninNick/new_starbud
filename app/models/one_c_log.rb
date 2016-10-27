# == Schema Information
#
# Table name: one_c_logs
#
#  id                           :integer          not null, primary key
#  request_headers              :text
#  request_params               :text
#  request_body                 :text
#  request_url                  :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  attachment_file_file_name    :string
#  attachment_file_content_type :string
#  attachment_file_file_size    :integer
#  attachment_file_updated_at   :datetime
#  session_id                   :string
#

# t.text :request_headers
# t.text :request_params
# t.text :request_body
class OneCLog < ActiveRecord::Base
  attr_accessible *attribute_names

  has_attached_file :attachment_file
  attr_accessible :attachment_file

  do_not_validate_attachment_file_type :attachment_file

end
