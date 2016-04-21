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
    controls: false
  #    pagerCustom: ".promotion-banner-pager"