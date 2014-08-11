Ollert.List = DS.Model.extend
  title: DS.attr()
  board: DS.belongsTo 'board', {async: true}
  cards: DS.hasMany 'card', {async: true}
  before: DS.attr()
