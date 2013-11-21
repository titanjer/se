config = {api: {}}

production = false

config.api.root = if production
  'http://api.socialendorsement.com'
else
  'http://127.0.0.1:3333/api'

config.api.versionRoot = config.api.root + '/v1'

module.exports = config
