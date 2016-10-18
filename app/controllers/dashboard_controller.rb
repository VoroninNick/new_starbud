class DashboardController < ApplicationController

  def index
    @recommended_doors = Door.all
  end
end
