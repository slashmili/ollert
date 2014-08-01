Ollert.CardCommentController = Ember.ObjectController.extend
  editing_comment: false
  actions:
    edit_comment_form: () ->
      @toggleProperty 'editing_comment'
      false
    cancel_comment_form: () ->
      @toggleProperty 'editing_comment'
      false
    save_text: () ->
      self = @
      @get('model').set('text', @get('text'))
      @get('model').save().then () ->
        self.toggleProperty 'editing_comment'
