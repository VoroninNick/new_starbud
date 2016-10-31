class CatalogController < ApplicationController
  layout "dashboard"

  def doors
    @doors = Door.all
  end
  
  def product
    # @door = Door.find_by_slug(params[:title])

    # @door_variant = product_class.find_product_variant_by_string(params[:title])

    @door_variant = DoorVariant.find_by_full_slug(params[:title])

    if @door_variant
      @product = @door_variant.door_color.door

      @product_colors = @product.door_colors

      @product_color = @door_variant.door_color

      @welts = @product_color.door_variant_welts
      @door_frames = @product_color.door_variant_frames
      @door_add_boards = @product_color.door_variant_additional_boards
      @door_strips = @product_color.door_variant_strips

      @product_variant = @door_variant

      @total_price = @product_variant.current_price
      @available_colors = @product.available_colors
    end

  end
end
