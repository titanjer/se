View = require 'views/base/view'

module.exports = class HeaderView extends View
  autoRender: true
  id: 'header'
  tagName: 'header'
  template: require './templates/header'
