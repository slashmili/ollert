module 'Card integration',
  setup: () ->
    resetFixtures()
    #turnOnRESTAdapter()
    #fakehr.start()
    Ollert.reset()
    Ollert.__container__.lookup('controller:application').set('current_user', {id: 10, email: 'zack@bar.com'})
  teardown: () ->
    #fakehr.stop()
    #Ollert.reset()

test 'Add new card', ()->
  visit '/boards/1'
  andThen () ->
    first_list = find('section.add-card').first()
    click(first_list)
  ok 1
  #andThen () ->
  #lists = {"cards":[],"lists":[{"id":30,"title":"Todo","board_id":6,"card_ids":[]},{"id":31,"title":"Doing","board_id":6,"card_ids":[]},{"id":32,"title":"Done","board_id":6,"card_ids":[]}]}
  #visitAndRespond '/boards/6', 'get', '/api/v1/lists', lists
