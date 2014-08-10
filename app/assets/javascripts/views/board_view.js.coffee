Ollert.BoardView = Ember.View.extend
  didInsertElement: () ->
    self = @
    $('.lists-sortable').sortable
      handle: 'header'
      connectWith: ".lists-sortable"
      update: (event, ui) ->
        list_id = ui.item.children('header').data('id')
        after_id = ui.item.nextAll('.list:first').children('header').data('id')
        self.get('controller').updateListsOrder(list_id, after_id)
