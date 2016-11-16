class CartController < ApplicationController
  layout :get_layout


  def index
    @recommended_doors = Door.order("RANDOM()").limit(4)
  end
  def purchased

  end
  def drafts

  end

  def get_layout
    "cart_layout"
  end
end
