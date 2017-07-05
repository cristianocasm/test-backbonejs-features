class TestBackbone.Models.Entry extends Backbone.Model

  win: ->
    @set(winner: true).save()
    @trigger("highlightLastWinner")
