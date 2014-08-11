Ollert.BoardListsController = Ember.ArrayController.extend
  needs: 'board'
  adding_list: false
  new_list_title: ''
  actions: {
    add_list_form: () ->
      @toggleProperty 'adding_list'
      false
    add_list: () ->
      board = @get('controllers.board').get('model')
      list = @get('store').createRecord 'list',
        title: @get('new_list_title')
        board: board
        before: 0

      self = @
      list.save().then (list) ->
        self.set 'new_list_title', ''
        self.toggleProperty 'adding_list'
        board.get('lists').pushObject(list)
  }
