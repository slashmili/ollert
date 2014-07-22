Ollert.Router.map ()->
  @resource 'boards', () ->
    @resource 'board', { path: '/:board_id' }, () ->
      @resource 'card', { path: '/:card_id' }
  @route('signup')
  @route('login')
