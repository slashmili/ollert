Ollert.CardRoute = Ember.Route.extend
  model: (params) ->
    Ollert.Card.create({id: params.card_id}).fetch()
  setupController: (controller, model) ->
    if model.id
      id = model.id
    else
      id = model.get('id')
    card = Ollert.Card.create {id: id}
    card.fetch()
    controller.set('content', card)
