# == Schema Information
#
# Table name: catalog_floor_brands
#
#  id         :integer          not null, primary key
#  name       :string
#  country    :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class Catalog::Floor::BrandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
