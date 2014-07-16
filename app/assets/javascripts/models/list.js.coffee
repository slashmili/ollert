Ollert.List = DS.Model.extend
  title: DS.attr()
  board: DS.belongsTo('board')
  cards: DS.hasMany('card')
