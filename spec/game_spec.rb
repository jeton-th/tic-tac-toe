# Testing Tic Tac Toe
require './lib/board'
require './lib/game'

RSpec.shared_examples 'check_winner' do |a, b, c|
  before Board do
    @board_class = Board.new
    @board = @board_class.board
  end

  it 'checks if we have a winner' do
    @board[0] = [a, b, c]
    expect(@board_class.check_winner).to be true
  end
end

RSpec.describe 'tests the input from user' do
  include_examples 'check_winner', 'O', 'O', 'O'
  include_examples 'check_winner', 'X', 'X', 'X'
end

RSpec.shared_examples 'input' do |field|
  before Game do
    @game = Game.new
  end

  it 'sanitizes input' do
    expect(@game.input).to eql(field)
  end
end

RSpec.describe 'tests the input from user' do
  include_examples 'input', '11'
  include_examples 'input', '00'
end
