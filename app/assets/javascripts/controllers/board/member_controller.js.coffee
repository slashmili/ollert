Ollert.BoardMemberController = Ember.ObjectController.extend
  changing_permission: false
  actions:
    make_admin: () ->
      @get('model').set('roles', ['admin'])
      @get('model').save()

    make_normal: () ->
      @get('model').set('roles', ['normal'])
      @get('model').save()

    cancel_change_permission_form: () ->
      @toggleProperty 'changing_permission'
      false
    open_change_permission_form: () ->
      @toggleProperty 'changing_permission'
      false
    leave_board: () ->
      mem = @get('model')
      mem.deleteRecord()
      mem.save()
