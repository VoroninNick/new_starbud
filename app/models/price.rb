# == Schema Information
#
# Table name: prices
#
#  id           :integer          not null, primary key
#  product_id   :integer
#  product_type :string
#  user_id      :integer
#  currency     :string
#  price        :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

# t.integer :product_id
# t.string :product_type
# t.belongs_to :user
#
# t.string :currency
# t.float :price
class Price < ActiveRecord::Base
  belongs_to :user
  belongs_to :product, polymorphic: true

end
