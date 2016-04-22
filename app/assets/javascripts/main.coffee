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
  $("ul#coverage-map").bxSlider
  #    auto: true,
    pause: 5000
    controls: true
  #    pagerCustom: ".promotion-banner-pager"

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

