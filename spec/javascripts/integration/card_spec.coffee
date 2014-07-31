module 'Card integration',
  setup: () ->
    resetFixtures()
    Ollert.reset()
    Ollert.__container__.lookup('controller:application').set('current_user', {id: 10, email: 'zack@bar.com'})
  teardown: () ->
    #Ollert.reset()

test 'Add new card', ()->
  visit '/boards/1'
  andThen () ->
    first_list = find('section.add-card').first()
    click(first_list)
  ok 1
