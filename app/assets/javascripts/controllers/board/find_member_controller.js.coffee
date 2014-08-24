Ollert.BoardFindMemberController = Ember.ArrayController.extend
  needs: 'board'
  content: null
  init: () ->
    @set('model', @store.find('user', {search: ''}))
    @_super()
  members: ( ->
    if @get('search_new_member') and @get('search_new_member').length > 3
      @set('model', @store.find('user', {search: @get('search_new_member')}))
    else
      @set('model', @store.find('user', {search: ''}))
  ).property('search_new_member')

  actions:
    add_member: (member) ->
      self = @
      console.log @get('controllers.board').get('model')
      membership = @get('store').createRecord 'membership',
        board: @get('controllers.board').get('model')
        user: member
        roles: ['normal']
      membership.save().then () ->
        self.set 'search_new_member', ''
        self.get('controllers.board').get('memberships').pushObject(membership)



