bind_select_field_to_select2 = ->
  $('#vehicle_city, #vehicle_model, #vehicle_color').select2( { tags: true, theme: "bootstrap" } )
  $('#vehicle_engine_type, #vehicle_transmission, #vehicle_assembly_type').select2( { theme: "bootstrap",  minimumResultsForSearch: -1 } )

$(document).on 'turbolinks:load', ->
  bind_select_field_to_select2()