Ollert.BoardView = Ember.View.extend
  didInsertElement: () ->
    $('.lists-sortable').sortable
      handle: 'header'
      connectWith: ".lists-sortable"
