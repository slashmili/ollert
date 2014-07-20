Ollert.BoardRoute = Ember.Route.extend
  model: (params) ->
    Ollert.Board.create({id: params.board_id}).fetch()
  setupController: (controller, model) ->
    board = Ollert.Board.create {id: model.id}
    board.get('lists').fetch()
    Ollert.Milad =  board.get('lists')
    Ollert.Milad.forEach (d) ->
      console.log(d)
    controller.set('content', board)
