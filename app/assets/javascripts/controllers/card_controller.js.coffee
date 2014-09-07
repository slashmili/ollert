Ollert.CardController = Ember.ObjectController.extend
  needs: 'board'
  editing_title: false
  editing_description: false
  adding_comment: false
  editing_lables: false
  editing_members: false
  new_comment: ''
  board_tags: ( ->
    @get("controllers.board").get("model").get("tags")
  ).property()

  memberships: ( ->
    @get "controllers.board.model.memberships"
  ).property()

  actions:
    cancel_card_title_form: () ->
      @set 'editing_title', false
    edit_card_title_form: () ->
      @set 'editing_title', true
    save_title: () ->
      @get('model').set('title', @get('title'))
      @set 'editing_title', false
      @get('model').save()

    edit_description_form: () ->
      @toggleProperty 'editing_description'
      false
    cancel_description_form: () ->
      @toggleProperty 'editing_description'
      false
    save_description: () ->
      @get('model').set('description', @get('description'))
      @toggleProperty 'editing_description'
      @get('model').save()

    add_comment_form: () ->
      @toggleProperty 'adding_comment'
    add_comment: () ->
      self = @
      comment = @get('store').createRecord 'comment',
        text: @get('new_comment')
        card: @get('model')

      comment.save().then () ->
        self.toggleProperty 'adding_comment'
        self.set 'new_comment', ''
        self.get('model').get('comments').pushObject(comment)
    edit_label_form: () ->
      @toggleProperty 'editing_lables'
      false
    add_remove_tag: (tag) ->
      tags = @get('model').get('tags') || []
      tag_index = tags.indexOf(tag)
      if tag_index == -1
        tags.pushObject tag
      else
        tags.removeAt(tag_index, 1)
      @get('model').set('tags', tags)
      @get('model').save()

    edit_members_form: () ->
      @toggleProperty 'editing_members'
      false

    add_remove_member: (user) ->
      member_ids = @get('model').get('member_ids') || []
      member_index = member_ids.indexOf(user.id)
      console.log member_index
      if member_index == -1
        member_ids.pushObject user.id
      else
        member_ids.removeAt member_index, 1
      console.log member_ids
      @get('model').set('member_ids', member_ids)
      @get('model').save()
