Ollert.Card = DS.Model.extend
  title: DS.attr()
  position: DS.attr()
  description: DS.attr()
  list: DS.belongsTo 'list', {async: true}

