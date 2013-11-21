Controller = require 'controllers/base/controller'
Collection = require 'models/base/collection'

HeaderView = require 'views/home/header-view'

HomePageView = require 'views/home/home-page-view'

Profile = require 'models/profile'
ProfileView = require 'views/home/profile-view'

FriendsView = require 'views/home/friends-view'

config = require 'config'

module.exports = class HomeController extends Controller
  beforeAction: ->
    super
    @compose 'header', HeaderView, region: 'header'

  index: ->
    @view = new HomePageView region: 'main'
    
    ## Profile
    # {{{
    @profile = new Profile
    @profile.url = "#{config.api.versionRoot}/profile.json"

    @profileView = new ProfileView
      region: 'profile'
      model: @profile

    @profile.fetch().then @profileView.render
    
    # }}}

    ## Friends
    # {{{
    @friends = new Collection null, Profile
    @friends.url = "#{config.api.versionRoot}/friends.json"

    @friendsView = new FriendsView
      region: 'friends'
      collection: @friends

    @friends.fetch() # CollectionView listen change.

    # }}}
