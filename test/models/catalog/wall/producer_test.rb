# == Schema Information
#
# Table name: catalog_wall_producers
#
#  id         :integer          not null, primary key
#  name       :string
#  slug       :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class Catalog::Wall::ProducerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
