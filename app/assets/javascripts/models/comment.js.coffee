Ollert.Comment = DS.Model.extend
  text: DS.attr()
  created_at: DS.attr('date')
  card: DS.belongsTo 'card', {async: true}
