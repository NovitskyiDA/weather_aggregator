initAutocomplete = ->
  autocomplete = new (google.maps.places.Autocomplete)($('[data-location-input]')[0], types: [ 'geocode' ])
  autocomplete.addListener 'place_changed', ->
    place = autocomplete.getPlace()
    country = place.address_components[..].pop().long_name
    country_code = place.address_components[..].pop().short_name
    city = place.address_components[0].long_name
    form = $('form.location')
    form.find('#location_city').val city
    form.find('#location_country').val country
    form.find('#location_country_code').val country_code
    form.submit()
    $('[data-location-input]').val('')
    $('.abc').spin('large', 'white')

$(document).on 'turbolinks:load', ->
  initAutocomplete() if $('[data-location-input]').length > 0
