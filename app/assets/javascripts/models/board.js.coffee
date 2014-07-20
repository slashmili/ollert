Ollert.Board = Ember.Resource.define
  url: '/boards',
  schema: {
    id:    Number
    title:  String
    lists: {
      type:     Ember.ResourceCollection,
      itemType: 'Ollert.List',
      url:      '/boards/%@/lists'
    }
  }
