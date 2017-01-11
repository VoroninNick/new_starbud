# == Schema Information
#
# Table name: catalog_door_exterior_door_variants
#
#  id                     :integer          not null, primary key
#  width                  :integer
#  height                 :integer
#  segment                :string
#  coating_type           :string
#  opening_side           :string
#  exterior_door_color_id :integer
#  one_c_id               :string
#  price                  :string
#  price_minimal          :string
#  price_group_first      :string
#  price_group_second     :string
#  currency               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  full_slug              :string
#  full_name              :string
#  promotion              :boolean
#  new                    :boolean
#  recommended            :boolean
#

require 'test_helper'

class Catalog::Door::ExteriorDoorVariantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
