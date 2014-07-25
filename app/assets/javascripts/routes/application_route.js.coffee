Ollert.ApplicationRoute = Ember.Route.extend
  model: () ->
    self = @
    $.ajax
      url: '/users/current_user.json'
      type: 'GET'
      success: (data) ->
        self.controllerFor('application').set 'current_user', data if data.id != -1
      error: (xhr, textStatus, errorThrown) ->
        err = eval "(#{xhr.responseText})"
        #self.set 'errors', err.errors
