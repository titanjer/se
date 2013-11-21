View = require 'views/base/view'
Collection = require 'models/base/collection'


module.exports = class AddTagsView extends View
  template: require './templates/add-tags'
  className: 'add-tags'

  render: ->
    super
    @delegate 'click', '.add-tags-toggle-panel-btn', @toggleView
    @delegate 'click', '.add-tags-panel-ok', @toggleView

  toggleView: (e) =>
    console.debug @$, e
    @$('.add-tags-panel').slideToggle 'slow'
    return
