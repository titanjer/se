CollectionView = require 'views/base/collection-view'

FriendView = require './friend-view'

module.exports = class FriendsView extends CollectionView
  autoRender: true
  itemView: FriendView
