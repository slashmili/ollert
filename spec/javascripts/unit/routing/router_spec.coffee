module 'Routing specs',
  setup: () ->
    Ollert.reset()
    resetFixtures()
  teardown: () ->
    Ollert.reset()


test 'root route', () ->
  routesTo('/', 'index')

test 'login route', () ->
  routesTo('/auth/login', 'auth.login')

test 'signup route', () ->
  routesTo('/auth/signup', 'auth.signup')

test 'board routes', () ->
  routesTo('/boards', 'boards.index')
