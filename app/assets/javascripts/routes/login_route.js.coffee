Ollert.LoginRoute = Ember.Route.extend
  model: -> Ember.Object.create()
  actions:
    login: ->
      @controllerFor("auth").login this
