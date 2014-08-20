Ollert.Membership = DS.Model.extend
  user: DS.belongsTo 'user'
  board: DS.belongsTo 'board'
  roles: DS.attr()
  has_admin_role: Ember.computed 'roles', ->
    @has_role('admin')

  has_normal_role: (->
    @has_role('normal')
  ).property('roles')

  has_role: (role) ->
    if @get('roles').indexOf(role) == -1
      return false
    else
      return true

