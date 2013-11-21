# The application object.
module.exports = class Application extends Chaplin.Application

  # Create additional mediator properties.
  initMediator: ->
    # Add additional application-specific properties and methods
    # e.g. Chaplin.mediator.prop = null

    #Chaplin.mediator.user = null
    ## for Dev, fake User
    User = require 'models/user'
    Chaplin.mediator.user = new User id: 1234

    # Seal the mediator.
    super
