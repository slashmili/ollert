module 'Board integration',
  setup: () ->
    turnOnRESTAdapter()
    fakehr.start()
    Ollert.reset()
    Ollert.__container__.lookup('controller:application').set('current_user', {id: 10, email: 'zack@bar.com'})
  teardown: () ->
    fakehr.stop()
    resetFixtures()
    Ollert.reset()

test 'load board index', ()->
  boards = {"boards":[{"id":6,"title":"Foo 2","list_ids":[18,19,20]},{"id":9,"title":"New board and go to","list_ids":[27,28,29]}]}

  visitAndRespond '/boards', 'get' , '/api/v1/boards', boards
  andThen () ->
    board = /Board Foo/.test(find 'section.boards .board')
    boards = find('section.boards .board').length
    equal boards, 2, 'Expect to find 2 boards'
