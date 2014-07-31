module 'Board integration',
  setup: () ->
    resetFixtures()
    Ollert.reset()
    Ollert.__container__.lookup('controller:application').set('current_user', {id: 10, email: 'zack@bar.com'})
  teardown: () ->
    #Ollert.reset()

test 'load board index', () ->
  visit '/boards'
  andThen () ->
    board = /Board Foo/.test(find 'section.boards .board')
    boards = find('section.boards .board').length
    equal boards, 2, 'Expect to find 2 boards'
test 'add new board', () ->
  visit '/'
  andThen () ->
    click '#add_board_form'
    fillIn '#new_board_name', 'Testing Board'
    click('#new_board_form button')
    andThen () ->
      ok(/Testing Board/.test($('section.board header').text()))
      currentRoute('board.index')
