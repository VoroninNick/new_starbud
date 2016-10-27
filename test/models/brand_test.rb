# == Schema Information
#
# Table name: brands
#
#  id             :integer          not null, primary key
#  title          :string
#  slug           :string
#  country        :string
#  brandable_id   :integer
#  brandable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
