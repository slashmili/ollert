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
  Ollert.Board.FIXTURES = [{id: 1, title: 'Board 01', lists: [1, 2, 3]}, {id: 2, title: 'Board 02', lists: [5, 6, 7]}]
  Ollert.List.FIXTURES = [
    {id: 1, title: 'Todo', board_id: 1}, {id: 2, title: 'Doing', board_id: 1}, {id: 3, title: 'Done', board_id: 1},
    {id: 4, title: 'Todo', board_id: 2}, {id: 5, title: 'Doing', board_id: 2}, {id: 6, title: 'Done', board_id: 2},
  ]

root.turnOnRESTAdapter = () ->
  Ollert.ApplicationAdapter = DS.RESTAdapter
  Ollert.Store = DS.Store.extend
    adapter: '-active-model'

  DS.RESTAdapter.reopen {namespace: "api/v1"}
