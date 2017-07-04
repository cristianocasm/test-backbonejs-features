# Creates namespace for Backbone objects
window.TestBackbone =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> alert 'Hello from Backbone!'

$(document).ready ->
  TestBackbone.initialize()
