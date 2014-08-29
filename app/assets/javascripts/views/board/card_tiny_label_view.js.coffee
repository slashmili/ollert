Ollert.BoardCardTinyLabelView = Ember.View.extend
  classNameBindings: ['tag_color']
  tagName: 'div'
  tag_color: ( ->
    "label #{@get('label')}-label"
  ).property()
