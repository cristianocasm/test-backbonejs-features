# Creates namespace for Backbone objects AND
# instantiates needed classes
window.TestBackbone =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    # creates routes of application
    new TestBackbone.Routers.Entries()
    # routes de initial URL path
    Backbone.history.start()

$(document).ready ->
  TestBackbone.initialize()
