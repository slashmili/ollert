Ollert.List = Ember.Resource.define
  url: '/lists'
  schema: {
    id: Number
    title: String
    board: {
      type: Ollert.Board
    }
    cards: {
      type: Ember.ResourceCollection
      itemType: 'Ollert.Card'
      nested: true
    }
  }

Ollert.Card = Ember.Resource.define
  url: '/cards'
  schema: {
    id: Number
    title: String
    position: Number
    list: {
      type: Ollert.List
    }
  }
