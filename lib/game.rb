# Game Class
class Game
  def initialize
    @turn = 1
    @winner = false

    @board = Board.new
  end

  def start
    game_end = false

    until game_end
      input = false

      until input
        move # show the board and the instructions
        field = gets.chomp
        input = input(field) # ask for input and sanitize
      end

      play = play(input)
      game_end = check_game if play
    end
  end

  def move
    @board.show_board
    puts 'Insert field to play.'
    print "Player #{@turn}: "
  end

  def input(field)
    if field.length == 2 && '012'.include?(field[0]) && '012'.include?(field[1])
      field
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
