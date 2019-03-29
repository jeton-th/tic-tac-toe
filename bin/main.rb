require '../lib/game'
require '../lib/board'

game = Game.new

game_end = false
until game_end

  input = false
  until input
    game.move # show the board and the instructions
    input = game.input # ask for input and sanitize
  end

  play = game.play(input)

  game_end = game.check_game if play

end
