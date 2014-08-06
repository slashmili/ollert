module 'Board/List',
  setup: () ->
    resetFixtures()
    Ollert.reset()
    Ollert.__container__.lookup('controller:application').set('current_user', {id: 10, email: 'zack@bar.com'})
  teardown: () ->
    #Ollert.reset()

test 'Add a new list', () ->
  visit '/boards/1'
  andThen () ->
    new_list_form = find('.new-list.input')
    equal new_list_form, 1, 'Expect to see the input box to enter list title'
