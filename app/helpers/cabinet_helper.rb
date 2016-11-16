module CabinetHelper

  def get_offer_products
    @recommended_doors = Door.order("RANDOM()").limit(4)
  end
end
