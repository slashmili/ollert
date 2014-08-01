moduleFor 'controller:cardComment', 'Comment Controller',
  setup: () ->
    Ollert.reset()
    #resetFixtures()
  teardown: () ->
    Ollert.reset()

test 'calling the action add_comment_form', ()->
  expect 2
  ctrl = @subject()

  equal ctrl.get('editing_comment'), false
  ctrl.send 'edit_comment_form'
  equal ctrl.get('editing_comment'), true
