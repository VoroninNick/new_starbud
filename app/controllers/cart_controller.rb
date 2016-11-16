class CartController < ApplicationController
  layout :get_layout


  def index

  end
  def purchased

  end
  def drafts

  end

  def get_layout
    "cart_layout"
  end
end
