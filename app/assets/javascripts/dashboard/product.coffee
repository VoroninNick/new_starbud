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
# unchecked checked radio button
#===================================================================
#  $('.product-one-scheme input[type="radio"]').change ->
#    console.log "who: ", $(@)
#    if $(@).is(':checked')
#      console.log "this el is checked"
#      $(@).prop('checked', false)
#    else
#      $(@).prop('checked', true)

#  $('.product-info-block-body input[type="radio"]:checked').click ->
#    $('.product-info-block-body input[type="radio"]:checked').each ->
#      $(@).attr 'checked', false


#    $(this).checked = false
#  $('.product-info-block-body input:radio').bind 'click mousedown', do ->
#    isChecked = undefined
#    (event) ->
#      if event.type == 'click'
#        if isChecked
#          isChecked = @checked = false
#        else
#          isChecked = true
#      else
#        isChecked = @checked
#
