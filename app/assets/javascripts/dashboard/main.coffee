


$(document).ready ->
#===================================================================
#  open main menu
#===================================================================
  $('a.navicon-button').click ->
    $(@).toggleClass 'open'
    $('body').toggleClass 'opened-menu'