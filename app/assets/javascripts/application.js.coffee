#= require jquery
#= require jquery_ujs
#= require handlebars
#= require ember
#= require ember-data
#= require bootstrap
#= require_self
#= require ollert

# for more details see: http://emberjs.com/guides/application/
window.Ollert = Ember.Application.create
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true
  LOG_VIEW_LOOKUPS: true
  rootElement: '#ollert-app'
