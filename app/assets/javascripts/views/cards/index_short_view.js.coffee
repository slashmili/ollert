Ollert.CardsIndexShortController = Ember.ArrayController.extend
  #sortProperties: ['position']
  #sortAscending: false
  actions:
    updateSortOrder: () ->
      console.log('ddddd')

Ollert.CardsIndexShortView = Ember.View.extend
  templateName: 'cards/index_short'
  didInsertElement: () ->
    controller = @get('controller')
    self = @
    @$(".sortable").sortable
      connectWith: ".sortable"
      update: (event, ui) ->
        card_id = ui.item.data('id')
        list_id = ui.item.parent().parent().parent().data('id')
        card = Ollert.Card.create({id: card_id})
        prev_pos = ui.item.prev().data('position') or 0.0
        next_pos = ui.item.next().data('position') or parseFloat(prev_pos) + 1.0
        new_pos = (parseFloat next_pos + parseFloat prev_pos)/2
        card.set('position', new_pos)
        card.set('list_id', list_id)
        card.save()
    .disableSelection()
