Ollert.CardsIndexShortView = Ember.View.extend
  templateName: 'cards/index_short'
  didInsertElement: () ->

    #console.log @get('controller.model')
    #console.log @get('content')
    #events = @get('controller.model').map (record) ->
    #console.log record
    self = @
    #console.log @get('controller.controllers.list').toString()
    @$(".sortable").sortable
      connectWith: ".sortable"
      update: (event, ui) ->
        card_id = ui.item.data('id')
        card = self.get('controller.store').find('card', card_id)
        prev_pos = ui.item.prev().data('position') or 0.0
        next_pos = ui.item.next().data('position') or parseFloat(prev_pos) + 1.0
        new_pos = (parseFloat next_pos + parseFloat prev_pos)/2
        card.then (card) ->
          list_id = ui.item.parent().parent().parent().data('id')
          self.get('controller.store').find('list', list_id).then (list) ->
            self.get('controller').updateSortOrder(card, list, new_pos)

      update3: (event, ui) ->
        card_id = ui.item.data('id')
        list_id = ui.item.parent().parent().parent().data('id')
        card = self.get('controller.store').find('card', card_id)
        card.then (card) ->
          list_id = ui.item.parent().parent().parent().data('id')
          list = self.get('controller.store').find('list', list_id)
          list.then (l_item) ->
            prev_pos = ui.item.prev().data('position') or 0.0
            next_pos = ui.item.next().data('position') or parseFloat(prev_pos) + 1.0
            new_pos = (parseFloat next_pos + parseFloat prev_pos)/2
            #card.set 'list_id', list.get('id')
            console.log card.get('list')
            console.log l_item
            card.set 'list', l_item
            card.set 'position', new_pos
            console.log card.get('list')
            card.save()
    .disableSelection()
