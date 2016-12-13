class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @recommended_exterior_doors = Catalog::Door::ExteriorDoor.with_recommended_variant.limit(4)
    @recommended_doors = Door.with_recommended_variant.limit(8)
    @new_doors = Door.with_news_variant.limit(4)
    @promotion_doors = Door.with_promotion_variant.limit(4)

    @floors = Catalog::Floor::Floor.all
  end
end
