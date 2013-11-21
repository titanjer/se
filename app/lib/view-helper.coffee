# Application-specific view helpers
# http://handlebarsjs.com/#helpers
# --------------------------------

register = (name, fn) ->
  Handlebars.registerHelper name, fn


# Conditional evaluation
# ----------------------

# Choose block by user login status
register 'ifLoggedIn', (options) ->
  method = if Chaplin.mediator.user then options.fn else options.inverse
  method this

register 'equal', (lvalue, rvalue, options) ->
  if (arguments.length < 3)
      throw new Error 'Handlebars Helper equal needs 2 parameters'
  if lvalue != rvalue
      options.inverse this
  else
      options.fn this

register 'ifUser', (id, options) ->
  if (arguments.length != 2)
      throw new Error 'Handlebars Helper equal needs a parameters'
  if Chaplin.mediator.user?.get('id') == id
    options.fn this
  else
    options.inverse this


# Map helpers
# -----------

# Make 'with' behave a little more mustachey.
register 'with', (context, options) ->
  if not context or Handlebars.Utils.isEmpty context
    options.inverse(this)
  else
    options.fn(context)

# Inverse for 'with'.
register 'without', (context, options) ->
  inverse = options.inverse
  options.inverse = options.fn
  options.fn = inverse
  Handlebars.helpers.with.call(this, context, options)

# Get Chaplin-declared named routes. {{url "likes#show" "105"}}
register 'url', (routeName, params..., options) ->
  Chaplin.helpers.reverse routeName, params
