$(document).on 'turbolinks:load', ->
  $('#clear-filters').on 'click', ->
    $('.filters').val('')

  $('#toggle-btn').click ->
    $('#hide-filters').toggle('slow')
    $('#filter-arrow')[0].classList.toggle('dropup')
    if $('#filter-arrow')[0].classList.contains('dropup')
      $('#toggle-btn').text('Less Filters')
    else
      $('#toggle-btn').text('More Filters')

