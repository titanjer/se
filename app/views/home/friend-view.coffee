View = require 'views/base/view'

template = require './templates/friend'

module.exports = class FriendView extends View
  template: template
  id: 'col_suggest'

  initialize: ->
    super
    @delegate 'click', '.cancel', @closeView

  closeView: (e) ->
    $(e.target).parent().slideToggle('normal')
