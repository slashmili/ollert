Ollert.BoardsRoute = Ember.Route.extend
  model: () ->
    boards = Ember.ResourceCollection.create
      type: Ollert.Board
    boards.fetch()
