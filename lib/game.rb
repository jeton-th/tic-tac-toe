# Game Class
class Game
  def initialize
    @turn = 1
    @winner = false

    @board = Board.new
  end

  def move
    @board.show_board
    puts 'Insert field to play.'
    print "Player #{@turn}: "
  end

  def input
    input = gets.chomp
    if input.length == 2 && '012'.include?(input[0]) && '012'.include?(input[1])
      input
    else
      puts 'The field does not exist.'
      false
    end
  end

  def play(input)
    insert = @board.insert(input, @turn)
    if insert
      true
    else
      puts 'The field is not empty'
      false
    end
  end

  def check_game
    if @board.check_winner
      @board.show_board
      puts "Game over. The winner is Player #{@turn}."
      true
    elsif @board.board_full
      @board.show_board
      puts 'Game over. We have no winner.'
      true
    else
      @turn = @turn == 1 ? 2 : 1
      false
    end
  end
end
