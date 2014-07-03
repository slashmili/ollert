# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

board_show_ready = () ->
  $('.new-card-opener').click (e)->
    div_name = $(this).data('popupname')
    $('#' + div_name).toggleClass('hidden')
    e.preventDefault()

  $('.new-card-closer').click (e)->
    div_name = $(this).data('popupname')
    $('#' + div_name).toggleClass('hidden')

  $('#newListOpener').click (e)->
    $('#addListPopup').toggleClass('hidden')
    e.preventDefault()

  $('#submitNewList').click (e)->
    $('#addListPopup').toggleClass('hidden')

  $('.cards').sortable {
    connectWith: '.cards',
    receive: (e, ui) ->
      card_id = ui.item.data('card-id')
      list_id = ui.item.parent().data('list-id')
      $.ajax({url:'/cards/' + card_id + '.json', type: 'PUT', data:{'card[list_id]':list_id}})
  }
  .disableSelection()

$( document ).ready(board_show_ready)
$( document ).on('page:load', board_show_ready)
