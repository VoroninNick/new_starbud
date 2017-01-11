# == Schema Information
#
# Table name: door_variants
#
#  id                 :integer          not null, primary key
#  door_id            :integer
#  name_color         :string
#  icon_file_name     :string
#  icon_content_type  :string
#  icon_file_size     :integer
#  icon_updated_at    :datetime
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  slug               :string
#  canvas_size        :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  price              :string
#  price_minimal      :string
#  price_group_first  :string
#  price_group_second :string
#  currency           :string
#  promotion          :boolean
#  new                :boolean
#  recommended        :boolean
#  door_color_id      :integer
#  one_c_id           :string
#  full_name          :string
#  full_slug          :string
#  available_amount   :integer
#

require 'test_helper'

class DoorVariantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
