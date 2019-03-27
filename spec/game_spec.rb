# Testing bin/game.rb
require './lib/game'
require './lib/board' 

RSpec.describe Game do
  describe '#move' do
    it 'controls the flow of the game' do
      game = Game.new
      expect(game.move).to receive(@board.show_board)
    end
  end
end
