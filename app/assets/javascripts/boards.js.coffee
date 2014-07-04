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
      prev_pos = ui.item.prev().data('card-position') or 0.0
      next_pos = ui.item.next().data('card-position') or parseFloat(prev_pos) + 1.0
      new_pos = (parseFloat next_pos + parseFloat prev_pos)/2
      $.ajax {
        url:'/cards/' + card_id + '.json',
        type: 'PUT',
        data: {'card[list_id]':list_id, 'card[position]': new_pos}
      }
      ui.item.data('card-position', new_pos)
  }
  .disableSelection()

  $('.new-card-form').bind 'ajax:success', (evt, data, status, xhr) ->
    li = "<li data-card-id='#{data.id}' data-card-position='#{data.position}'>#{data.title}</li>"
    $("#cardList#{data.list_id}").append(li)

$( document ).ready(board_show_ready)
$( document ).on('page:load', board_show_ready)
