# == Schema Information
#
# Table name: our_representatives
#
#  id                  :integer          not null, primary key
#  person              :string
#  region              :string
#  phone               :string
#  published           :boolean
#  position            :integer
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class OurRepresentativeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
