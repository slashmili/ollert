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

test 'add new board', ()->
  boards = {"board":{}}
  visitAndRespond '/boards', 'get' , '/api/v1/boards', boards
  andThen () ->
    new_board = {"boards":[{id: 10, title: 'Testing Board'}]}
    click '#add_board_form'
    fillIn '#new_board_name', 'Testing Board'
    click('#new_board_form button').httpRespond('post', '/api/v1/boards', new_board, 200)
    andThen () ->
      ok(/Testing Board/.test($('section.board header').text()))
      currentRoute('board.index')
