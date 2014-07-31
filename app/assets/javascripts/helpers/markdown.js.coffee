Ember.Handlebars.helper 'markdown', (input) ->
  text = Handlebars.Utils.escapeExpression(input)
  showdown = new Showdown.converter()
  new Ember.Handlebars.SafeString(showdown.makeHtml(text))
