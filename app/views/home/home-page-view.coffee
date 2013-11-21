View = require 'views/base/view'

ProfileView = require './profile-view'
FriendsView = require './friends-view'

module.exports = class HomePageView extends View
  autoRender: true
  className: 'home-page'
  template: require './templates/home'
  regions:
    profile: '#col_profile'
    friends: '#col_friends'

