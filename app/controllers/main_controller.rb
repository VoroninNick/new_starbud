class MainController < ApplicationController

  def index

  end

  def become_a_dealer
    data = params.permit(:name, :phone, :email, :company)
    Subscribe.become_a_dealer(data).deliver
    head :ok
  end

  def contact_us
    data = params.permit(:name, :email, :message)
    Subscribe.contact_us(data).deliver
    head :ok
  end
end
