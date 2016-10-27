# == Schema Information
#
# Table name: promotions
#
#  id                     :integer          not null, primary key
#  title                  :string
#  slug                   :string
#  short_description      :text
#  body                   :text
#  image_file_name        :string
#  image_content_type     :string
#  image_file_size        :integer
#  image_updated_at       :datetime
#  published              :boolean
#  date_begin             :date
#  date_finish            :date
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  right_order            :boolean
#  white_style            :boolean
#  thumbnail_file_name    :string
#  thumbnail_content_type :string
#  thumbnail_file_size    :integer
#  thumbnail_updated_at   :datetime
#

require 'test_helper'

class PromotionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
