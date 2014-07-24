Ollert.HeaderController = Ember.Controller.extend
  needs: 'application'
  current_user: Ember.computed.alias('controllers.application.current_user')
