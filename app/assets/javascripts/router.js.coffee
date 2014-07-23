Ollert.Router.map ()->
  @resource 'auth', () ->
    @route 'signup'
    @route('login')

  @resource 'boards', () ->
    @resource 'board', { path: '/:board_id' }, () ->
      @resource 'card', { path: '/:card_id' }
