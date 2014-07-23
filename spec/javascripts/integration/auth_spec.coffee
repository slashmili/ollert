module 'Auth integration', () ->
  setup: () ->
    i = 1
  teardown: () ->
    Ollert.reset()

test 'Login page', () ->
  visit '/auth/login'
  andThen () ->
    section_login = find('section.login')
    ok section_login.length , "Element section.login should be there"
