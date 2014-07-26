root = exports ? this
root.routesTo = (url, route_name) ->
  visit url
  andThen () ->
    current_route = Ollert.__container__.lookup('controller:application').currentRouteName
    equal current_route, route_name, "Expected #{route_name} got: #{current_route}"

root.currentRoute = (route_name) ->
    current_route = Ollert.__container__.lookup('controller:application').currentRouteName
    equal current_route, route_name, "Expected #{route_name} got: #{current_route}"

root.resetFixtures = () ->
  Ollert.ApplicationAdapter = DS.FixtureAdapter
  Ollert.Board.FIXTURES = [{id: 1, title: 'Board 01'}, {id: 2, title: 'Board 02'}]
