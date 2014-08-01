Ember.Handlebars.helper 'moment', (input) ->
  date = Handlebars.Utils.escapeExpression(input)
  new Ember.Handlebars.SafeString moment(new Date(date)).fromNow()
