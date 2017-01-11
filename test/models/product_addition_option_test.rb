# == Schema Information
#
# Table name: product_addition_options
#
#  id                :integer          not null, primary key
#  productable_id    :integer
#  productable_type  :string
#  short_description :text
#  specification     :text
#  attention         :text
#  warranty          :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class ProductAdditionOptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
