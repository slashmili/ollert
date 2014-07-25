#= require jquery
#= require jquery_ujs
#= require jquery.ui.sortable
#= require handlebars
#= require ember
#= require ember-data
#= require bootstrap
#= require ember-resource.min
#= require_self
#= require ollert

# for more details see: http://emberjs.com/guides/application/
window.Ollert = Ember.Application.create
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true
  LOG_VIEW_LOOKUPS: true
  rootElement: '#ollert-app'
  ready: ->
    $(document).ajaxError (event, request, settings) ->
      if request.status == 401 && !["/users/current_user.json"].contains(settings.url)
        controller = Ollert.__container__.lookup('controller:application')
        controller.transitionToRoute('auth.login')

$(document).ready () ->
  token = $('meta[name="csrf-token"]').attr('content')
  $.ajaxPrefilter (options, originalOptions, xhr) ->
    xhr.setRequestHeader('X-CSRF-Token', token)
