# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$.fn.uncheckableRadio = ->
#  alert 't'
#  @each ->
#    $(this).mousedown ->
#      $(this).data 'wasChecked', @checked
#
#    $(this).click ->
#      if $(this).data('wasChecked')
#        @checked = false


$(document).ready ->
#===================================================================
# change product color
#===================================================================
  $('input[type=radio][name=color_variant]').change ->
    $this = $(@)
    $wrap = $this.closest(".color-select-variant")
    $page_wrap = $this.closest(".product-page")

    $prev_image = $page_wrap.find(".product-avatar img")
    $prev_image_title = $page_wrap.find(".product-avatar .title")

    $checked_radio = $wrap.find('input:checked')

    asset_src = $checked_radio.attr "data-image"
    asset_title = $checked_radio.attr "data-title"

    $prev_image.attr "src", asset_src
    $prev_image_title.text(asset_title)

#===================================================================
# change prouct option
#===================================================================
  $('body').on "change",".calculator-option-select.dynamic-cos", ->
    $this = $(@)
    $wrap = $this.closest(".product-body")

    if $wrap.hasClass("changed")
    else
      if !$wrap.hasClass("changed")
        $wrap.addClass("changed")

#===================================================================
# .product-one-scheme unchecked
#===================================================================
  $('.product-one-scheme input').on 'change', ->
    $('.product-one-scheme input').not(this).prop 'checked', false


#===================================================================
# .product-one-scheme unchecked
#===================================================================
  $('.product-scheme-variant input').on 'change', ->
    $('.product-scheme-variant input').not(this).prop 'checked', false


#===================================================================
# exterior door calcing
#===================================================================
