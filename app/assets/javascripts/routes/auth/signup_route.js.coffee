Ollert.AuthSignupRoute = Ember.Route.extend
  model: -> Ember.Object.create()
  actions:
    register: ->
      @controllerFor("auth").register this
