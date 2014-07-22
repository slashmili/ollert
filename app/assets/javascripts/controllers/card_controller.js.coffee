Ollert.CardController = Ember.ObjectController.extend
  editing_title: false
  actions:
    cancel_card_title_form: () ->
      @set 'editing_title', false
    edit_card_title_form: () ->
      @set 'editing_title', true
    save_title: () ->
      @get('model').set('title', @get('title'))
      @set 'editing_title', false
      @get('model').save()
