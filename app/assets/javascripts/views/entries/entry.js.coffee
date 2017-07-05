class TestBackbone.Views.Entry extends Backbone.View
  template: JST['entries/show']
  tagName: "li"

  render: ->
    # since model was passed in on class
    # instantiation, we can now use it to pass
    # in to template
    @$el.html(@template(entry: @model))
    this
