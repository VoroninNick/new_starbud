# == Schema Information
#
# Table name: door_producers
#
#  id         :integer          not null, primary key
#  title      :string
#  slug       :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  height     :integer
#

require 'test_helper'

class DoorProducerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
