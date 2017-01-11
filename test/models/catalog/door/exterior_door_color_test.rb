# == Schema Information
#
# Table name: catalog_door_exterior_door_colors
#
#  id                :integer          not null, primary key
#  name              :string
#  slug              :string
#  icon_file_name    :string
#  icon_content_type :string
#  icon_file_size    :integer
#  icon_updated_at   :datetime
#  exterior_door_id  :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class Catalog::Door::ExteriorDoorColorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
