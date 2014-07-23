root = exports ? this
root.routesTo = (url, route_name) ->
  visit url
  andThen () ->
    current_route = Ollert.__container__.lookup('controller:application').currentRouteName
    equal current_route, route_name, "Expected #{route_name} got: #{current_route}"
