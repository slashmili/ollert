Ollert.CardController = Ember.ObjectController.extend
  editing_title: false
  editing_description: false
  adding_comment: false
  new_comment: ''
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
      console.log @toString()
      comment = @get('store').createRecord 'comment',
        text: @get('new_comment')
        card: @get('model')

      comment.save().then () ->
        self.toggleProperty 'adding_comment'
        self.set 'new_comment', ''
        self.get('model').get('comments').pushObject(comment)
