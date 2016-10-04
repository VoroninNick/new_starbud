class CatalogController < ApplicationController
  layout "dashboard"

  def doors

  end
  
  def product
    @door = Door.first
  end
end
