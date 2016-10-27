# == Schema Information
#
# Table name: doors
#
#  id                 :integer          not null, primary key
#  title              :string
#  slug               :string
#  brand_string       :string
#  description        :text
#  product_type       :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  specification      :text
#  attention          :text
#  warranty           :text
#  brand_id           :integer
#  door_collection_id :integer
#

require 'test_helper'

class DoorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
