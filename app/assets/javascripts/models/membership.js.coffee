Ollert.Membership = DS.Model.extend
  user: DS.belongsTo 'user'
  board: DS.belongsTo 'board'
  roles: DS.attr()
