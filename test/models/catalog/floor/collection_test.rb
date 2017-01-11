# == Schema Information
#
# Table name: catalog_floor_collections
#
#  id                     :integer          not null, primary key
#  name                   :string
#  slug                   :string
#  catalog_floor_brand_id :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'test_helper'

class Catalog::Floor::CollectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
