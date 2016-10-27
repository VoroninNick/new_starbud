# == Schema Information
#
# Table name: door_variant_welts
#
#  id                 :integer          not null, primary key
#  name               :string
#  slug               :string
#  one_c_id           :string
#  price              :string
#  price_minimal      :string
#  price_group_first  :string
#  price_group_second :string
#  currency           :string
#  door_color_id      :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class DoorVariantWeltTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
