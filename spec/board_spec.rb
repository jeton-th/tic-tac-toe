# Testing bin/game.rb
require './lib/board'

RSpec.shared_examples 'check_winner' do |a, b, c|
  before Board do
    @board_class = Board.new
    @board = @board_class.board
  end

  it 'cheks if we have a winner' do
    @board[0] = [a, b, c]
    expect(@board_class.check_winner).to be true
  end
end

RSpec.describe 'tests the input from user' do
  include_examples 'check_winner', 'O', 'O', 'O'
  include_examples 'check_winner', 'X', 'O', 'O'
  include_examples 'check_winner', 'O', 'X', 'O'
  include_examples 'check_winner', nil, 'O', 'O'
  include_examples 'check_winner', 'X', 'X', 'X'
end
