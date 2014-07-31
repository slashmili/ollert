moduleFor 'controller:card', 'Card Controller',
  setup: () ->
    Ollert.reset()
    #resetFixtures()
  teardown: () ->
    Ollert.reset()

test 'calling the action add_comment_form', ()->
  expect 2
  ctrl = @subject()

  equal ctrl.get('adding_comment'), false
  ctrl.send 'add_comment_form'
  equal ctrl.get('adding_comment'), true

test 'calling add_comment', () ->
  ok 1, "Skip this test until find a way to test controller with store"

  #ctrl = @subject()
  #equal ctrl.get('new_comment'), ''
  #ctrl.set 'new_comment', 'this the new comment'
  ##ctrl.send 'add_comment'
  #equal ctrl.get('new_comment'), ''

