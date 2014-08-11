Ollert.BoardController = Ember.ObjectController.extend
  updateListsOrder: (list_id,after_id) ->
    @get('store').find('list', list_id).then (list) ->
      list.set 'before', after_id
      list.save()
