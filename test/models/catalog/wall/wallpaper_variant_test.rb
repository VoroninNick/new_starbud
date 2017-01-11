# == Schema Information
#
# Table name: catalog_wall_wallpaper_variants
#
#  id                        :integer          not null, primary key
#  name                      :string
#  slug                      :string
#  icon_file_name            :string
#  icon_content_type         :string
#  icon_file_size            :integer
#  icon_updated_at           :datetime
#  avatar_file_name          :string
#  avatar_content_type       :string
#  avatar_file_size          :integer
#  avatar_updated_at         :datetime
#  catalog_wall_wallpaper_id :integer
#  amount_pack               :integer
#  available_amount          :integer
#  one_c_id                  :string
#  price                     :string
#  price_minimal             :string
#  price_group_first         :string
#  price_group_second        :string
#  currency                  :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

require 'test_helper'

class Catalog::Wall::WallpaperVariantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
