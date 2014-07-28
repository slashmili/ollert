Ollert.CardsIndexShortController = Ember.ArrayController.extend
  needs: ['list']
  sortProperties: ['position']
  sortAscending: true
  updateSortOrder: (card, list, position) ->
    card.set 'position', position
    card.set 'list', list
    card.save()
