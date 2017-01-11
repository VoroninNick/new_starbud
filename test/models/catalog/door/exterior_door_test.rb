# == Schema Information
#
# Table name: catalog_door_exterior_doors
#
#  id                 :integer          not null, primary key
#  title              :string
#  slug               :string
#  brand              :string
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  description        :text
#  specification      :text
#  attention          :text
#  warranty           :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  door_collection_id :integer
#

require 'test_helper'

class Catalog::Door::ExteriorDoorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
