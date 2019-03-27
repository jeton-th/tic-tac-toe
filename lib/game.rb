require '../lib/board'

# Game Class
class Game
  def initialize
    @turn = 1
    @winner = false

    @board = Board.new
    move
  end

  def move
    @board.show_board
    puts 'Insert field to play.'
    print "Player #{@turn}: "
    input
  end

  def input
    input = gets.chomp
    if input.length == 2 && '012'.include?(input[0]) && '012'.include?(input[1])
      play(input)
    else
      puts 'The field does not exist.'
      move
    end
  end

  def play(input)
    insert = @board.insert(input, @turn)
    if insert
      check_game
    else
      puts 'The field is not empty'
      move
    end
  end

  def check_game
    if @board.check_winner
      @board.show_board
      puts "Game over. The winner is Player #{@turn}."
    elsif @board.board_full
      @board.show_board
      puts 'Game over. We have no winner.'
    else
      @turn = @turn == 1 ? 2 : 1
      move
    end
  end
end
