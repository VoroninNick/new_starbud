# == Schema Information
#
# Table name: prices
#
#  id           :integer          not null, primary key
#  product_id   :integer
#  product_type :string
#  user_id      :integer
#  currency     :string
#  price        :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class PriceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
