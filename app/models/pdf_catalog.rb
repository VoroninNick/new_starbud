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

# t.has_attached_file :catalog

class PdfCatalog < ActiveRecord::Base

  attr_accessible :catalog
  has_attached_file :catalog
  validates_attachment_content_type :catalog, :content_type =>['application/pdf']

  rails_admin do
    navigation_label 'Головна сторінка'

    label 'PDF Каталог'
    label_plural 'PDF Каталоги'

    list do
    end

    edit do
      field :catalog do
        label 'Каталог:'
        help 'Завантажувати тільки в форматі pdf'
      end
    end
  end

end
