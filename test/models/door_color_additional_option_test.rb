# == Schema Information
#
# Table name: door_color_additional_options
#
#  id                    :integer          not null, primary key
#  title                 :string
#  slug                  :string
#  door_variant_color_id :integer
#  canvas_size           :string
#  box                   :string
#  welt                  :string
#  price                 :string
#  price_minimal         :string
#  price_group_first     :string
#  price_group_second    :string
#  currency              :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class DoorColorAdditionalOptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
