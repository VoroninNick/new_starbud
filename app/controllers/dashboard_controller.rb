class DashboardController < ApplicationController

  def index
    @recommended_doors = Door.with_recommended_variant.limit(8)
    @new_doors = Door.with_news_variant.limit(4)
    @promotion_doors = Door.with_promotion_variant.limit(4)
  end
end
