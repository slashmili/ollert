# for more details see: http://emberjs.com/guides/controllers/

Ollert.AuthController = Ember.Controller.extend
  register: (route) ->
    me = @
    $.ajax
      url: '/users.json'
      type: "POST"
      data:
        "user[name]": route.currentModel.name
        "user[email]": route.currentModel.email
        "user[password]": route.currentModel.password
        "user[password_confirmation]": route.currentModel.password_confirmation
      success: (data) ->
        me.set 'currentUser', data.user
        route.transitionTo 'home'
      error: (xhr, textStatus, errorThrown) ->
        err = eval "(#{xhr.responseText})"
        route.controllerFor('signup').set "errorMsg", "That email/password combo didn't work.  Please try again"

