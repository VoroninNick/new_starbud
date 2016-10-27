# == Schema Information
#
# Table name: about_company_histories
#
#  id          :integer          not null, primary key
#  year        :integer
#  title       :string
#  description :text
#  published   :boolean
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class AboutCompanyHistoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
