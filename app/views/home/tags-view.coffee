CollectionView = require 'views/base/collection-view'

TagView = require './tag-view'

module.exports = class TagsView extends CollectionView
  itemView: TagView

