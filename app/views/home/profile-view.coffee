TagsView = require './tags-view'
AddTagsView = require './add-tags-view'
Tag = require 'models/tag'

View = require 'views/base/view'
Collection = require 'models/base/collection'


module.exports = class ProfileView extends View
  autoRender: true
  template: require './templates/profile'

  regions:
    'info': '#profile'                  #'.profile-info-container'
    'add-tags': '.add-tags-container'   #'.add-profile-tags-container'
    'tags': '#tags'                     #'.profile-tags-list-container'

  render: ->
    super
    @createTagsView()
    @createAddTagsView()

  createTagsView: =>
    if @model.has('tags')
      @tags = new Collection @model.get('tags'), model: Tag
      tagsView = new TagsView collection: @tags, region: 'tags'
      tagsView.render()
      
  createAddTagsView: =>
    addTagsView = new AddTagsView model: @model, region: 'add-tags'
    addTagsView.render()

