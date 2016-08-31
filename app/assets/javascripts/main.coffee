# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#===================================================================
# countdown timer
#===================================================================
$ ->
  countdown_timer = $('.countdown-special-offer')
  countdown_timer.each ->
    ct_year = $(@).attr "data-year"
    ct_month = $(@).attr "data-month"
    ct_day = $(@).attr "data-day"
    $(@).countdown
      until: new Date(ct_year, parseInt(ct_month)-1, ct_day), onTick: watchCountdown

watchCountdown = (periods) ->
#  console.log 'args: ', arguments
  total_count_days = parseInt($('.countdown-special-offer').attr 'data-count-days')
  day = (1 - periods[3] / total_count_days) * 100
  hour = (1 - periods[4] / 24) * 100
  min = (1 - periods[5] / 60) * 100
  sec = (1 - periods[6] / 60) * 100

#  console.log 'days: ', total_count_days

#  test_sec = (1 - periods[6] / 60) * 100
#  console.log 'test sec: ', test_sec

  $('.count-section-day .status-bar span').css("width", "#{day}%")
  $('.count-section-hour .status-bar span').css("width", "#{hour}%")
  $('.count-section-min .status-bar span').css("width", "#{min}%")
  $('.count-section-sec .status-bar span').css("width", "#{sec}%")

#  $('#monitor').text 'Just ' + periods[5] + ' minutes and ' + periods[6] + ' seconds to go'



$(document).ready ->
#===================================================================
#  photo - video gallery
#===================================================================
  $('.lightGallery').lightGallery ->
    thumbnail: true

#===========================================================
# file upload
#===========================================================
  $('.file-upload input:file').change ->
    $this = $(@)
    $wrap =$this.closest('form')
    $file_name = $wrap.find('.fu-file')
    exists_file = $this[0].files[0]

    console.log 'value',exists_file.name

    if exists_file
      $wrap.addClass('file-exists')
      $file_name.text(exists_file.name)
    else
      $wrap.removeClass('file-exists')

  $('.file-upload .fu-remove').click ->
    $this = $(@)
    $wrap =$this.closest('form')

    $wrap.removeClass('file-exists')
    $wrap.find('input:file').val("")



#  wrapper = $('.file_upload')
#  inp = wrapper.find('input')
#  btn = wrapper.find('button')
#  lbl = wrapper.find('span')
#  btn.focus ->
#    inp.focus()
#    return
#  # Crutches for the :focus style:
#  inp.focus(->
#    wrapper.addClass 'focus'
#    return
#  ).blur ->
#    wrapper.removeClass 'focus'
#    return
#
#  btn.add(lbl).click ->
#    alert 'test'
#    inp.click()
#
#  file_api = if window.File and window.FileReader and window.FileList and window.Blob then true else false
#  inp.change(->
#    file_name = undefined
#    console.log "file_api: ", file_api
#    if file_api and inp[0].files[0]
#      file_name = inp[0].files[0].name
#    else
#      file_name = inp.val().replace('C:\\fakepath\\', '')
#    if !file_name.length
#      return
#    if lbl.is(':visible')
#      lbl.text file_name
#      btn.text 'Выбрать'
#    else
#      btn.text file_name
#    return
#  ).change()

#===========================================================
# page up
#===========================================================
  $('.scroll-top-button').click ->
    $("html, body").animate
      scrollTop: 0
    , 800
    false

#  =========================================================================
#  main banner
#  =========================================================================
  $("ul#main-banner").bxSlider
    auto: true
    pause: 5000
#    controls: false
  #    pagerCustom: ".promotion-banner-pager"

#  =========================================================================
#  about company - our history
#  =========================================================================
  $("ul.ac-our-history-carousel").bxSlider
    auto: false
    pause: 5000
    paginationSpeed: 3000

#  =========================================================================
#  about company - our partners
#  =========================================================================
  owl1 = $("ul#our-partners")
  owl1.owlCarousel
    pagination: false,
    navigation: false,
    items: 6 #10 items above 1000px browser width
    itemsMobile: false # itemsMobile disabled - inherit from itemsTablet option
    autoPlay : true

# =========================================================================
#  feedback clients
#  =========================================================================
  $("ul#feedback-clients-carousel").bxSlider
  #    auto: true,
    pause: 5000
    controls: false

# =========================================================================
# mobile menu handler
#==========================================================================

  $('.mobile-menu-icon').click ->
    if $(@).hasClass('open')
      $(@).removeClass('open')
      $('body').removeClass('locked-body')
    else
      $(@).addClass('open')
      $('body').addClass('locked-body')

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
    autoPlay : true

#  =========================================================================
#  our partners carousel
#  =========================================================================
  owl1 = $("ul#main-page-certificates-slider")
  owl1.owlCarousel
    pagination: false
    navigation: true
    items: 6 #10 items above 1000px browser width
    itemsMobile: false # itemsMobile disabled - inherit from itemsTablet option
    autoPlay : false


#===========================================================
# callback handler for contact form submit
#===========================================================
  $('.close-button').click ->
    $(@).closest('.success-wrap').hide()

# ===========================================================
# callback handler for contact form submit
#===========================================================
  $('form.ajax-form').submit (e) ->
    $this = $(@)
    postData = $this.serializeArray()
    formURL = $this.attr('action')
    form = this

    $.ajax
      url: formURL
      dataType: 'html'
      type: "POST"
      data: postData
      beforeSend: ->
        console.log('before send')
      success: ->
        console.log('success')
        $('.success-wrap').show()
        setTimeout ->
#          something param
          $('.success-wrap').hide()
        , 3000

        form.reset()
        $this.closest('form').find('.animate-input').each ->
#          if !$(@).hasClass('is-locked-for-clear')
          $(@).removeClass('is-completed')

#        $this.closest('form').find('.field-to-hide').each ->
#          $(@).addClass('hide')

      complete: ->
        console.log('complete')
      error: ->
        console.log('error')

    e.preventDefault()

# ==========================================================
# handler owl certificates
#===========================================================
  owleg = $("#our-certeficates-carousel")
  owleg.owlCarousel()

  gallery = null
  $('#our-certeficates-carousel .owl-item').click ->
    $wrap =$(@).closest('#our-certeficates-carousel')
    slides = $wrap.find('.image')

    cii = $(@).index()
    elmenetsListData = $.map($wrap.find('.image'), (el) ->
      {
        src: $(el).attr 'data-gallery-src'
        thumb: $(el).attr 'data-gallery-thumb'
      }
    )
    console.log("cii", cii)
    $gallery = $('#our-certeficates-carousel')
    $gallery.lightGallery
      dynamic: true
      dynamicEl: elmenetsListData
      index: cii

    gallery ?= $gallery.data("lightGallery")
    gallery.index = cii
    console.log("gallery", gallery)
    window.gallery = gallery


#--------------
#  $popup = $('#become_s_dealer')
#  $popup.foundation('open')
#  $popup.foundation('reveal', 'open')
#  $('#become_s_dealer').foundation('open');

#func = ()->
#
#$(".cont").on "click", "button.a", func
#
#create_elem = ()->
#  $btn = $("<button>")
#  $('.cont').append($btn)
#  $btn.click(fvunc)
#$(".cont button.a").click(fvunc)




#  popup
#
#  popup = new Foundation.Reveal($('#popup-modal'))
#  popup.open()