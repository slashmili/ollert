Ollert.AuthSignupController = Ember.Controller.extend
  errors: {}
  needs: 'application'
  actions:
    register: () ->
      self = @
      $.ajax
        url: '/users.json'
        type: "POST"
        data:
          "user[name]": self.get('name')
          "user[email]": self.get('email')
          "user[password]": self.get('password')
          "user[password_confirmation]": self.get('password')
        success: (data) ->
          self.get('controllers.application').set 'current_user', data
          self.transitionToRoute 'index'
        error: (xhr, textStatus, errorThrown) ->
          err = eval "(#{xhr.responseText})"
          self.set 'errors', err.errors
