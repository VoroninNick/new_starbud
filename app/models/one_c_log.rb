# t.text :request_headers
# t.text :request_params
# t.text :request_body
class OneCLog < ActiveRecord::Base
  attr_accessible *attribute_names

  has_attached_file :attachment_file
  attr_accessible :attachment_file


end
