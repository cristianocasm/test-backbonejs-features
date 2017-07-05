# Maps paths to JS functions
class TestBackbone.Routers.Entries extends Backbone.Router
  routes:
    "": "index"
    "entries/:id": "show" # maps to state #entries/:id

  initialize: ->
    @collection = new TestBackbone.Collections.Entries()
    @collection.fetch(reset: true) # async call!

  index: ->
    # views accepts collection as parameter
    view = new TestBackbone.Views.EntriesIndex(collection: @collection)
    $("#container").html(view.render().el);

  show: (id) ->
    alert "Entry #{id}"
