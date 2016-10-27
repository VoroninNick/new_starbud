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

require 'test_helper'

class OneCLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
