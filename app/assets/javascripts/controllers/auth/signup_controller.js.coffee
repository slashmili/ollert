Ollert.AuthSignupController = Ember.Controller.extend
  needs: 'application'
  actions:
    register: () ->
      current_user = {email: 'sam.rast@bar.com', id: 12}
      @get('controllers.application').set 'current_user', current_user
      @transitionToRoute 'index'
