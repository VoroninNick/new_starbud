#map = undefined
#initialize = ->
#  $map = $('#map_canvas')
#  lat = $map.attr 'data-lat'
#  lng = $map.attr 'data-lng'
#
#  address = $map.attr 'data-address'
#  city = $map.attr 'data-city'
#
#  myLatlng = new (google.maps.LatLng)(lat, lng)
#
##  styles = [
##    {
##      "stylers": [
##        { "feature_type": "all" },
##        { "element_type": "all" },
##        { "invert_lightness": true },
##        { "weight": 0.9 },
##        { "hue": "#0077ff" },
##        { "saturation": -28 },
##        { "gamma": 1.18 },
##        { "lightness": -9 }
##      ]
##    }
##  ]
#  styles = [
#    {
#      stylers: [
#        { "Saturation": "-100" }
#      ]
#    }
#  ]
#  styledMap = new google.maps.StyledMapType(styles, name: "StyledMap")
#
#  mapOptions =
#    zoom: 17
#    center: myLatlng
#    scrollwheel: false
#    mapTypeIds: [
#      google.maps.MapTypeId.ROADMAP
#      "map_style"
#    ]
#
#  map = new (google.maps.Map)(document.getElementById('map_canvas'), mapOptions)
#  map.mapTypes.set "map_style", styledMap
#  map.setMapTypeId "map_style"
#
#  contentString = "<div id=\"content\">" + "<div id=\"siteNotice\">" + "</div><div class=\"info-window\"><div class=\"address\"><p>Компанія «Стар-Буд»</p><p>"+address+"</p></div></div>" + "</div>"
#  infowindow = new (google.maps.InfoWindow)(
#    content: contentString
#
#  )
#  marker = new (google.maps.Marker)(
#    position: myLatlng
#    map: map
#    title: 'StarBud'
#    icon: '/assets/landing/map-marker.png')
#  google.maps.event.addListener marker, 'click', ->
#    infowindow.open map, marker
#
#google.maps.event.addDomListener window, 'load', initialize
#
## on resize map will allways centered
#google.maps.event.addDomListener window, 'resize', ->
#  center = map.getCenter()
#  google.maps.event.trigger map, 'resize'
#  map.setCenter center


#===========================================version 2


initialize = ->
  $map = $("#map_canvas")

  lat = $map.attr 'data-lat'
  lng = $map.attr 'data-lng'

  address = $map.attr 'data-address'
  city = $map.attr 'data-city'

#  phone1 = $("#g-map").attr 'data-phone1'
#  phone2 = $("#g-map").attr 'data-phone2'
#  phone3 = $("#g-map").attr 'data-phone3'

  myLatlng = new (google.maps.LatLng)(lat, lng)

  styles = [
    {
      stylers: [
        { "Saturation": "-100" }
      ]
    }
  ]

  styledMap = new google.maps.StyledMapType(styles,
    name: "Styled Map"
  )

  mapOptions =
    zoom: 16
    center: myLatlng
    scrollwheel: false
    mapTypeIds: [
      google.maps.MapTypeId.ROADMAP
      "map_style"
    ]

  map = new (google.maps.Map)(document.getElementById('map_canvas'), mapOptions)
  map.mapTypes.set "map_style", styledMap
  map.setMapTypeId "map_style"

#  contentString = "<div id=\"content\">" + "<div id=\"siteNotice\">" + "</div><div class=\"info-window\"><div class=\"address\"><p>"+address+"</p></div> <div class=\"phones\"><p>"+phone1+"</p></div> </div>" + "</div>"
  contentString = "<div id=\"content\">" + "<div id=\"siteNotice\">" + "</div><div class=\"info-window\"><div class=\"address\"><p>Компанія «Стар-Буд»</p><p>"+address+"</p></div></div>" + "</div>"
  infowindow = new (google.maps.InfoWindow)(
    content: contentString

  )
  marker = new (google.maps.Marker)(
    position: myLatlng
    map: map
    title: 'Star Bud'
    icon: '/assets/marker_new.png')
  google.maps.event.addListener marker, 'click', ->
    infowindow.open map, marker

google.maps.event.addDomListener window, 'load', initialize

# on resize map will allways centered
google.maps.event.addDomListener window, 'resize', ->
  center = map.getCenter()
  google.maps.event.trigger map, 'resize'
  map.setCenter center