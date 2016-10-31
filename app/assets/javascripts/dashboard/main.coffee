


$(document).ready ->
#===================================================================
#  open main menu
#===================================================================
  $('a.navicon-button').click ->
    $(@).toggleClass 'open'
    $('body').toggleClass 'opened-menu'


#===================================================================
# dashboard index page promotion banner
#===================================================================
  $("ul#promotion-banner").bxSlider
    auto: true
    pause: 5000
    controls: false
#    pagerCustom: ".promotion-banner-pager"

#===================================================================
# expand or hiden block body
#===================================================================
  $('body').on "click",".spb-switch-button", ->
    $this = $(@)
    $wrap = $this.closest('.standard-page-block')

    if $wrap.hasClass('hidden')
      $wrap.removeClass('hidden')
    else
      $wrap.addClass('hidden')

#===================================================================
# product card door change variant
#===================================================================
  $('body').on "click",".one-variant", ->
    $this = $(@)
    $wrap = $this.closest(".product-card-wrap")
    $wrap.find(".one-variant-wrap").removeClass("active")
    $this.parent().addClass("active")

    preview_el = $wrap.find('img')
    price_el = $wrap.find('.ps-price span')

    asset_src = $this.attr "data-asset"
    price = $this.attr "data-price"

    $link_to_product = $wrap.find('.pc-avatar a')
    product_url = $this.attr "data-url"

    color_name = $this.attr "data-color-name"
    $color_name = $wrap.find('.ps-titles .subtitle')

    console.log 'asset: ', asset_src
    console.log 'price: ', price

    preview_el.attr "src", asset_src
    $link_to_product.attr "href", product_url
    $color_name.text(color_name)
    price_el.text(price)

#===================================================================
# product card hover
#===================================================================
#  $('body').on "hover",".product-card-inner", (->
  $('.product-card-inner').hover (->
    el_height = $(@).find('img').height()
    $(@).find('.pc-avatar').css('max-height', "#{el_height}px")
  ), ->
    $(@).find('.pc-avatar').css('max-height', "260px")

#===================================================================
# expand tabs content
#===================================================================
  $(".tabs li a, .tabs-content .expand-tabs").click ->
    if $(".tabs-content").hasClass("expanded")
    else
      $(".tabs-content").addClass("expanded")

#===================================================================
# collapse product info block
#===================================================================
  $(".product-info-block-expand .product-info-block-head").click ->
    $this = $(@)
    $wrap = $this.closest('.product-info-block-expand')

    if $wrap.hasClass('expanded')
      $wrap.removeClass('expanded')
    else
      $wrap.addClass('expanded')


