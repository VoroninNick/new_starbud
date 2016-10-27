# == Schema Information
#
# Table name: publications
#
#  id                 :integer          not null, primary key
#  title              :string
#  slug               :string
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  body               :text
#  published          :boolean
#  featured           :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class PublicationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
