


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
