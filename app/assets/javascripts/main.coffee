# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
#  =========================================================================
#  main banner
#  =========================================================================
  $("ul#main-banner").bxSlider
  #    auto: true,
    pause: 5000
    controls: false
  #    pagerCustom: ".promotion-banner-pager"


#  =========================================================================
#  coverage map
#  =========================================================================

  total_slides =$('#coverage-map li').length
  $('.coverage-map-slide-status .total-slide').text(total_slides)

  map_slider = $("ul#coverage-map").bxSlider
  #    auto: true,
    pause: 5000
    controls: true
    infiniteLoop: false
  #    pagerCustom: ".promotion-banner-pager"

#    onSlideBefore: ->
#      $('.coverage-map-slide-status .total-slide').text(map_slider.getSlideCount())


    onSlideAfter: (currentSlideHtmlObject) ->
      current_slide = map_slider.getCurrentSlide()
      total_slides = map_slider.getSlideCount()
      $('.coverage-map-slide-status .current-slide').text(current_slide+1)
      $('.coverage-map-slide-status .total-slide').text(total_slides)

      console.log "current slide :", current_slide
      console.log "total slides :", total_slides
#      console.log "object :", currentSlideHtmlObject
#      console.log "html object :", currentSlideHtmlObject[0]
#      console.log "html object attr :", currentSlideHtmlObject[0]
      region_id = $(currentSlideHtmlObject[0]).attr("data-slide-to-region")
#      console.log "html test :", currentSlideHtmlObject.dataset.slideToRegion
      current_polygon = $('.coverage-map-wrap').find("[data-region-id='" + region_id + "']")
      $('#navigation-map polygon').removeClass('current')
      current_polygon.addClass('current')

#      console.log "informetion :", this

#      $slideElement = $(currentSlideHtmlObject)
#      current_element = $slideElement[0]
#      console.log "element - ", current_element
#
#      ret_i = current_element.attr("data-slide-to-region")
#      console.log "informetion details :", ret_i




  $('#navigation-map polygon.active').click (e) ->
    $this = $(@)
    $('#navigation-map polygon').removeClass('current')
    $this.addClass('current')
    reg_id = $this.attr('data-region-id')
    console.log 'data-region-id : ', reg_id

    i = $this.closest('.coverage-map-wrap').find("[data-slide-to-region='" + reg_id + "']").index()
    console.log 'index slide : ',i

    map_slider.goToSlide i
    map_slider.stopAuto()
#    restart = setTimeout((->
#      map_slider.startAuto()
#      return
#    ), 500)
#    false


#  =========================================================================
#  our partners carousel
#  =========================================================================
  owl1 = $("ul#our-partners")
  owl1.owlCarousel
    pagination: false,
    navigation: false,
    items: 6 #10 items above 1000px browser width
    itemsMobile: false # itemsMobile disabled - inherit from itemsTablet option
    autoPlay : false


