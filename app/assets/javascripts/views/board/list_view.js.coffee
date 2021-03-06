Ollert.BoardListView = Ember.View.extend
  tagName: 'section'
  classNames: 'list'
  didInsertElement: () ->
    self = @
    @$(".cards-sortable").sortable
      connectWith: ".cards-sortable"
      update: (event, ui) ->
        prev_pos = ui.item.prevAll('li:first').children().data('position') or 0.0
        next_pos = ui.item.nextAll('li:first').children().data('position') or parseFloat(prev_pos) + 1.0
        new_pos = (parseFloat next_pos + parseFloat prev_pos)/2

        card_id = ui.item.children().data('id')
        if ui.sender == null && ui.item.parent().is($(@))
          self.get('controller.store').find('card', card_id).then (card) ->
            self.get('controller').updateCardSortOrder(card, new_pos)
        else
          if ui.item.parent().is($(@))
            self.get('controller.store').find('card', card_id).then (card) ->
              self.get('controller').updateCardSortOrder(card, new_pos)
