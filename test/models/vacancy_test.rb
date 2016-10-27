# == Schema Information
#
# Table name: vacancies
#
#  id          :integer          not null, primary key
#  title       :string
#  slug        :string
#  city        :string
#  description :text
#  published   :boolean
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class VacancyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
