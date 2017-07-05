class TestBackbone.Views.EntriesIndex extends Backbone.View

  template: JST['entries/index']

  initialize: ->
    # since fetch method runs async, it's
    # mandatory to listen to that function
    # so that whenever it gets finished we
    # can update our view - "fetch" method
    # triggers "reset" event after finishing
    @collection.on("reset", @render, this)

  render: ->
    # since collection was passed in on class
    # instantiation, we can now use it to pass
    # in to template
    @$el.html(@template(entries: @collection))
    this
