Ollert.Card = DS.Model.extend
  title: DS.attr()
  position: DS.attr()
  description: DS.attr()
  list: DS.belongsTo 'list', {async: true}
  comments: DS.hasMany 'comment', {async: true}
  tags: DS.attr('array')
  include_tags: (new_tag) ->
    matched = false
    if @.get('tags')
      @.get('tags').forEach (tag) ->
        if new_tag.color == tag.color
          matched = true
    matched
  index_of_tag: (tag) ->
    index = -1
    c = -1
    if @.get('tags')
      @.get('tags').forEach (t) ->
        c++
        if tag.color == t.color
          index = c
    index
