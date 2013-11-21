View = require 'views/base/view'

template = require './templates/tag'

module.exports = class TagView extends View
  autoRender: true
  template: template

  listen:
    'change model': 'render'

  initialize: ->
    # {{{
    super
    
    @mouseover = false
    @endorsed = @model.get('endorsed')

    @delegate 'click', '.btn_en', (e) =>
      @endorsed = !@endorsed
      d = endorsed: @endorsed
      d['count'] = if @endorsed
          @model.get('count')+1
        else
          @model.get('count')-1
      @model.set d

    @delegate 'mouseover', '.btn_en', (e) =>
      $(e.target).addClass if @endorsed then 'endorse' else 'unendorse'
      $(e.target).find("span").css 'visibility', 'hidden'
      @mouseover = true

    @delegate 'mouseout', '.btn_en', (e) ->
      $(e.target).find("span").css 'visibility', 'visible'
      $(e.target).removeClass 'unendorse'
      $(e.target).removeClass 'endorse'
      @mouseover = false

    # }}}

  getTemplateData: ->
    data = super
    data.mouseover = @mouseover
    data

