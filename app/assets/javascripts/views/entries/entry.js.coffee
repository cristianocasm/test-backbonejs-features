class TestBackbone.Views.Entry extends Backbone.View
  template: JST['entries/show']
  tagName: "li"

  initialize: ->
    @model.on("change", @render)
    @model.on("highlightLastWinner", @highlight)

  highlight: =>
    $(".winner").removeClass("highlight")
    @$(".winner").addClass("highlight")

  render: =>
    # since model was passed in on class
    # instantiation, we can now use it to pass
    # in to template
    @$el.html(@template(entry: @model))
    this
