
$(document).ready ->
  $('.video-play-button').click ->
#    alert 'test'
    $('.video-control-info-panel').removeClass('active-youtube-panel')
    $video_panel = $(this).attr 'data-video-panel'
    $panel = $('.video-control-info-panel.'+$video_panel)
    $panel.addClass('active-youtube-panel')

    $video = $(this).attr 'data-video-id'
    $src_video = $('iframe#'+$video).attr 'data-video'

    $('iframe.youtube_video').attr src: ""
    $('iframe#'+$video).attr src: $src_video
#    $button_to_video = $(this).attr 'data-video-button'

