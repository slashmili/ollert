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
    click('.new-list a')
    new_list_form = find('.new-list input')
    equal new_list_form.length, 1, 'Expect to see the input box to enter list title'
