class Game
  require "../lib/board"

  def initialize
    @game_over = false
    @turn = 1

    @board = Board.new
    message
  end

  def message
    @board.show_board
    if @game_over
      puts "Game over. Player #{@turn} wins."
      puts ""
    else
      puts "Insert field to play."
      print "Player #{@turn}: "
      field = gets.chomp
      play(field)
    end
  end

  def play(field)
    if field.length == 2 && "012".include?(field[0]) && "012".include?(field[1])
      insert = @board.insert(field, @turn)
      if insert == true
        @turn = @turn == 1 ? 2 : 1
        @game_over = @board.check_winner
      else
        puts "The field is not empty."
      end
    else
      puts "That field does not exist."
    end
    message
  end
end

Game.new
