# == Schema Information
#
# Table name: product_statuses
#
#  id         :integer          not null, primary key
#  product_id :string
#  name       :string
#  status     :boolean
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ProductStatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
