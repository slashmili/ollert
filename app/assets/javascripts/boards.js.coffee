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

$( document ).ready(board_show_ready)
$( document ).on('page:load', board_show_ready)
