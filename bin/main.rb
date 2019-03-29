require '../lib/game'
require '../lib/board'

game = Game.new

winner = false
until @winner

  input = false
  until input
    game.move # show the board and the instructions
    input = game.input # ask for input and sanitize
  end

  insert = false
  until insert
    insert = game.play(input)
    game.move
  end

end
