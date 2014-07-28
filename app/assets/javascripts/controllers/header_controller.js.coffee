Ollert.HeaderController = Ember.Controller.extend
  needs: 'application'
  current_user: Ember.computed.alias('controllers.application.current_user')
  adding_board: false

  actions:
    addBoardForm: () ->
      @toggleProperty 'adding_board'
      false
    createBoard: () ->
      self = @
      board = @store.createRecord 'board',
        title: @get('title')
      board.save()
      .then () ->
        self.toggleProperty 'adding_board'
        self.set 'title', ''
        self.transitionToRoute 'board', board

