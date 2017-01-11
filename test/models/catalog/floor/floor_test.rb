# == Schema Information
#
# Table name: catalog_floor_floors
#
#  id                          :integer          not null, primary key
#  floor_type                  :string
#  name                        :string
#  slug                        :string
#  full_name                   :string
#  full_slug                   :string
#  marking                     :string
#  amount                      :float
#  product_unit                :string
#  avatar_file_name            :string
#  avatar_content_type         :string
#  avatar_file_size            :integer
#  avatar_updated_at           :datetime
#  perspective_file_name       :string
#  perspective_content_type    :string
#  perspective_file_size       :integer
#  perspective_updated_at      :datetime
#  structure_file_name         :string
#  structure_content_type      :string
#  structure_file_size         :integer
#  structure_updated_at        :datetime
#  interior_file_name          :string
#  interior_content_type       :string
#  interior_file_size          :integer
#  interior_updated_at         :datetime
#  one_c_id                    :string
#  price                       :string
#  price_minimal               :string
#  price_group_first           :string
#  price_group_second          :string
#  currency                    :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  catalog_floor_collection_id :integer
#

require 'test_helper'

class Catalog::Floor::FloorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
