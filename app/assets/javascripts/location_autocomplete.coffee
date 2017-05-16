initAutocomplete = ->
  autocomplete = new (google.maps.places.Autocomplete)($('[data-location-input]')[0], types: [ 'geocode' ])
  autocomplete.addListener 'place_changed', ->
    place = autocomplete.getPlace()
    country = place.address_components[..].pop().long_name
    city = place.address_components[0].long_name
    form = $('form.location')
    form.find('#location_city').val city
    form.find('#location_country').val country
    form.submit()

$(document).ready ->
  initAutocomplete()
