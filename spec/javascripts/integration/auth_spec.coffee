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

test 'Register a user', () ->
  visit '/auth/signup'
  ok find('#profile-link').length == 0, "Profile link should not shown"
  andThen () ->
    fillIn 'section.signup #name', 'Sam'
    fillIn 'section.signup #email', 'sam.rast@bar.com'
    fillIn 'section.signup #password', 'FooAndBuzzWentToBar'
    click  'section.signup #signup'
    andThen () ->
      current_user = Ollert.__container__.lookup('controller:application').get('current_user')
      ok current_user, "current user should be set after signup"
      equal current_user.email, 'sam.rast@bar.com'
      ok find('#profile-link').length, "And the profile link should show up"
      currentRoute('index')
