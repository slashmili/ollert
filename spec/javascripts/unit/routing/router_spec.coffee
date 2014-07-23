module 'Routing specs', () ->
  setup: () ->
    Ollert.reset()

test 'root route', () ->
  visit '/'
  andThen () ->
    current_route = Ollert.__container__.lookup('controller:application').currentRouteName
    equal current_route, 'index', 'Expected ******  got: ' + current_route
