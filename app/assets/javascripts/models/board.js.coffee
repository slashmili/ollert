Ollert.Board = DS.Model.extend
  title: DS.attr()
  lists: DS.hasMany('list', {async: true})
  public: DS.attr('boolean')
