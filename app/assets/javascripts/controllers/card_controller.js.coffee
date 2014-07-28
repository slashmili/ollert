Ollert.CardController = Ember.ObjectController.extend
  editing_title: false
  editing_description: false
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

