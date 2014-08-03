Ollert.ListView = Ember.View.extend
  didInsertElement: () ->
    self = @
    @$(".sortable").sortable
      connectWith: ".sortable"
      update: (event, ui) ->
        prev_pos = ui.item.prev().data('position') or 0.0
        next_pos = ui.item.next().data('position') or parseFloat(prev_pos) + 1.0
        new_pos = (parseFloat next_pos + parseFloat prev_pos)/2

        card_id = ui.item.data('id')
        if ui.sender == null && ui.item.parent().is($(@))
          self.get('controller.store').find('card', card_id).then (card) ->
            self.get('controller').updateCardSortOrder(card, new_pos)
        else
          if ui.item.parent().is($(@))
            self.get('controller.store').find('card', card_id).then (card) ->
              self.get('controller').updateCardSortOrder(card, new_pos)
