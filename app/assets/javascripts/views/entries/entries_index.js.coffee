class TestBackbone.Views.EntriesIndex extends Backbone.View
  template: JST['entries/index']

  events:
    "submit #new_entry": "createEntry"
    "template-rendered": "setup"

  initialize: ->
    # since fetch method runs async, it's
    # mandatory to listen to that function
    # so that whenever it gets finished we
    # can update our view - "fetch" method
    # triggers "reset" event after finishing
    @collection.on("reset", @render, this)
    @collection.on("add", @appendEntry, this)

  render: ->
    @$el.html(@template()).trigger("template-rendered")
    # since collection was passed in on class
    # instantiation, we can now use it
    @collection.each(@appendEntry, this)
    this

  setup: ->
    @$form = @$el.find("#new_entry")
    @$list = @$el.find("#entries")
    @$name = @$form.find("#new_entry_name")

  appendEntry: (entry) ->
    view = new TestBackbone.Views.Entry(model: entry)
    @$list.append(view.render().el)

  createEntry: (event) ->
    event.preventDefault()

    that = this
    attributes = name: @$name.val()
    @collection.create attributes,
      wait: true # prevents the "add" event from being fired till server returns with 200 response type
      success: -> that.$form[0].reset()
      error: @handleError

  handleError: (entry, response) ->
    if response.status == 422
      errors = response.responseJSON
      for attribute, message of errors
        alert "#{attribute} #{message}"
