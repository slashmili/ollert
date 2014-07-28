Ollert.ListController = Ember.ObjectController.extend
  adding_a_card: false
  actions: {
    cancel_card_form: () ->
      @set 'adding_a_card', false
    add_card_form: () ->
      @set 'adding_a_card', true
    save_new_card: () ->
      self = @

      card = @store.createRecord 'card',
        title: @get('new_card_title')
        list: @get('model')

      card.save().then () ->
        self.set('adding_a_card', false)
        self.set('new_card_title', '')
        self.get('model').get('cards').pushObject(card)
  }
