# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# $('#openNewBoardPopup').click(function (e) { $('#newBoardPopup').toggle() ; e.preventDefault(); })
dashboard_ready = () ->
  $('#openNewBoardPopup').click (e)->
    $('#newBoardPopup').toggle()
    e.preventDefault()

$( document ).ready(dashboard_ready)
$( document ).on('page:load', dashboard_ready)
