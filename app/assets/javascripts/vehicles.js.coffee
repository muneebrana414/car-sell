bind_select_field_to_select2 = ->
  $('#vehicle_city, #vehicle_model, #vehicle_color').select2( { tags: true, theme: "bootstrap" } )
  $('#vehicle_engine_type, #vehicle_transmission, #vehicle_assembly_type, #vehicle_currency').select2( { theme: "bootstrap",  minimumResultsForSearch: -1 } )

$(document).ready ->
  $('#copy-link').on 'click', ->
    that = this
    $(this).text ' Copied!'
    navigator.clipboard.writeText window.location.href
    setTimeout (->
      $(that).text ''
      return
    ), 1500
    return
  return

$(document).on 'turbolinks:load', ->
  bind_select_field_to_select2()