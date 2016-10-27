# == Schema Information
#
# Table name: door_variant_colors
#
#  id                 :integer          not null, primary key
#  name               :string
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  door_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  icon_file_name     :string
#  icon_content_type  :string
#  icon_file_size     :integer
#  icon_updated_at    :datetime
#  slug               :string
#  promotion          :boolean
#  new                :boolean
#  recommended        :boolean
#

require 'test_helper'

class DoorVariantColorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
