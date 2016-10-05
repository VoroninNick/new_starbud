class CatalogController < ApplicationController
  layout "dashboard"

  def doors
    @doors = Door.all
  end
  
  def product
    @door = Door.find_by_slug(params[:title])
  end
end
