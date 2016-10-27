# == Schema Information
#
# Table name: door_collections
#
#  id               :integer          not null, primary key
#  title            :string
#  slug             :string
#  door_producer_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class DoorCollectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
