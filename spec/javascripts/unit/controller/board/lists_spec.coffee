moduleFor 'controller:boardLists', 'Lists Controller',
  needs: ['controller:board']
  setup: () ->
    Ollert.reset()
    resetFixtures()
  teardown: () ->
    Ollert.reset()

test 'calling the action add_list_form', ()->
  expect 2
  ctrl = @subject()

  equal ctrl.get('adding_list'), false
  ctrl.send 'add_list_form'
  equal ctrl.get('adding_list'), true

test 'calling add_list', () ->

  save = sinon.stub()
  save.returns({then: (f)-> 1})
  store = sinon.stub()
  store.createRecord = sinon.stub()
  store.createRecord.returns({save:save})
  ctrl = @subject()
  Ember.run () ->
    ctrl.set 'store', store
    ctrl.get('controllers.board').set 'model', {id: 1, title:'my board'}
    equal ctrl.get('new_list_title'), ''
    ctrl.set 'new_list_title', 'Wish list'
    ctrl.send 'add_list'
    equal ctrl.get('new_list_title'), '', 'The title should be cleared'

