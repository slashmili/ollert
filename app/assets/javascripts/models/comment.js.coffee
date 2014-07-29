Ollert.Comment = DS.Model.extend
  text: DS.attr()
  card: DS.belongsTo 'card', {async: true}
