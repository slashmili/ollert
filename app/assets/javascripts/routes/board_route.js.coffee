Ollert.BoardRoute = Ember.Route.extend
  model: (params) ->
    console.log(params)
    @store.find('board', params.board_id)
  setupController: (controller, model) ->
    controller.set('content', model)
    controller.set('board_lists', @store.find('list', {board_id: model.id}))
