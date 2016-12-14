class CatalogController < ApplicationController
  layout "dashboard"

  def doors
    @filterrific = initialize_filterrific(
        Door,
        params[:filterrific],
        select_options: {
            sorted_by: Door.options_for_sorted_by,
        },
        default_filter_params: {}
    ) or return
    @products = @filterrific.find.page(params[:page])

    @exterior_doors = Catalog::Door::ExteriorDoor.all
    respond_to do |format|
      format.html
      format.js
    end

    # @doors = Door.all

  end
  
  def product


    @door_variant = DoorVariant.find_by_full_slug(params[:title])

    if @door_variant
      @product = @door_variant.door_color.door

      @product_colors = @product.door_colors

      @product_color = @door_variant.door_color

      @welts = @product_color.door_variant_welts
      @door_frames = @product_color.door_variant_frames
      @door_add_boards = @product_color.door_variant_additional_boards
      @door_strips = @product_color.door_variant_strips
      @door_add_options = @product_color.door_variant_additional_options

      @product_variant = @door_variant

      @total_price = @product_variant.current_price
      @available_colors = @product.available_colors
    end

  end

  def exterior_door

    @door_variant = Catalog::Door::ExteriorDoorVariant.find_by_full_slug(params[:title])


    if @door_variant
      @product = @door_variant.exterior_door_color.product

      @product_colors = @product.catalog_door_exterior_door_colors

      @product_color = @door_variant.exterior_door_color

      @product_variant = @door_variant

      @total_price = @product_variant.current_price
      @available_colors = @product.available_colors
    end
  end


  def floors
    @filterrific = initialize_filterrific(
        Catalog::Floor::Floor,
        params[:filterrific],
        select_options: {
            sorted_by: Door.options_for_sorted_by,
        },
        default_filter_params: {}
    ) or return
    @products = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
    # @products = Catalog::Floor::Floor.all
  end

  def floor
    @product = Catalog::Floor::Floor.find_by_full_slug(params[:title])
  end



  def door_variants


  end

end
