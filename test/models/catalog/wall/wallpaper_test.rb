# == Schema Information
#
# Table name: catalog_wall_wallpapers
#
#  id                       :integer          not null, primary key
#  name                     :string
#  short_description        :text
#  catalog_wall_producer_id :integer
#  image_file_name          :string
#  image_content_type       :string
#  image_file_size          :integer
#  image_updated_at         :datetime
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  slug                     :string
#

require 'test_helper'

class Catalog::Wall::WallpaperTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
