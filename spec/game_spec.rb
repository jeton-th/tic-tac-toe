# Testing Tic Tac Toe
require './lib/board'
require './lib/game'

RSpec.shared_examples 'check_winner' do |a, b, c, argument|
  before Board do
    @board_class = Board.new
    @board = @board_class.board
  end

  it 'checks if we have a winner' do
    @board[0] = [a, b, c]
    expect(@board_class.check_winner).to eql(argument)
  end
end

RSpec.describe 'tests the input from user' do
  include_examples 'check_winner', 'O', 'O', 'O', true
  include_examples 'check_winner', 'X', 'X', 'O', false
end

RSpec.shared_examples 'input' do |field|
  before Game do
    @game = Game.new
  end

  it 'sanitizes input' do
    expect(@game.input(field)).to eql(field)
  end
end

RSpec.describe 'tests the input from user' do
  include_examples 'input', '11'
  include_examples 'input', '00'
end

# testing @board.insert

RSpec.shared_examples 'insert' do |field, turn, argument|
  before Board do
    @board_class = Board.new
  end

  it 'checks if we can insert the symbol in that field' do
    @board_class.insert([0, 0], 'X')
    expect(@board_class.insert(field, turn)).to eql(argument)
  end
end

RSpec.describe 'tests the input from user' do
  include_examples 'insert', '10', 1, true
  include_examples 'insert', '00', 2, false
end

# testing board_full

RSpec.shared_examples 'board_full' do
  it 'checks if the board is full or not' do
    @board_class = Board.new
    @board_class.insert([0, 0], 'O')

    expect(@board_class.board_full).to eql(false)
  end

  it 'should return true on full board' do
    @board_class = Board.new
    i = 0
    while i < 3
      j = 0
      while j < 3
        @board_class.insert([i, j], j)
        j += 1
      end
      i += 1
    end

    expect(@board_class.board_full).to eql(true)
  end
end
