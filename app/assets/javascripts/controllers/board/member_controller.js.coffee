Ollert.BoardMemberController = Ember.ObjectController.extend
  changing_permission: false
  actions:
    make_admin: () ->
      @get('model').set('roles', ['admin'])
      @get('model').save()

    cancel_change_permission_form: () ->
      @toggleProperty 'changing_permission'
      false
    open_change_permission_form: () ->
      @toggleProperty 'changing_permission'
      false
