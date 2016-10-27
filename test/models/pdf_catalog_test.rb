# == Schema Information
#
# Table name: pdf_catalogs
#
#  id                   :integer          not null, primary key
#  catalog_file_name    :string
#  catalog_content_type :string
#  catalog_file_size    :integer
#  catalog_updated_at   :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class PdfCatalogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
