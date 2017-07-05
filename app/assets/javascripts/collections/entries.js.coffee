class TestBackbone.Collections.Entries extends Backbone.Collection

  # mapping under api path is a good practice
  # and avoids conflicts with Backbone routing
  url: "/api/entries"
  model: TestBackbone.Models.Entry

  chooseWinner: ->
    nonWinners = @where winner: false
    _.sample(nonWinners).win() if nonWinners.length
