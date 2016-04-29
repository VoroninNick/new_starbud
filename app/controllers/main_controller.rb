class MainController < ApplicationController

  def index

  end

  def become_a_dealer
    data = params.permit(:name, :phone, :email, :company)
    Subscribe.become_a_dealer(data).deliver
    head :ok
  end
end
