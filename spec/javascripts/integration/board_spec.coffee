module 'Auth integration',
  setup: () ->
    Ollert.reset()
    resetFixtures()
    #fakehr.start()
    Ollert.__container__.lookup('controller:application').set('current_user', {id: 10, email: 'zack@bar.com'})
  teardown: () ->
    Ollert.reset()
    #fakehr.stop()

test 'New Bord', () ->
  visit '/'
  click('section.header #add_board_form')#.httpRespond('get', '/users.json', current_user)
  fillIn 'section.header #new_board_name', "Board Foo"
  click('section.header button')#.httpRespond('post', '/api/v1/boards', {"board":{"id":8,"title":"Foo 3","list_ids":[24,25,26]}})
  ok 1
