module 'Auth integration', () ->
  setup: () ->
    i = 1
  teardown: () ->
    Ollert.reset()

test 'Login page', () ->
  visit '/auth/login'
  andThen () ->
    section_login = find('section.login')
    ok section_login.length , "Element section.login should exist"

test 'Sign up page', () ->
  visit '/auth/signup'
  andThen () ->
    section_signup = find('section.signup')
    ok section_signup.length, "Element section.signup should exist"
