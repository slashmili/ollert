Ollert.Router.map ()->
  @resource 'boards', () ->
    @resource 'board', { path: '/:board_id' }
  @route('signup')
  @route('login')
