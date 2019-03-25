# Class Game is the main class
class Game
  require '../lib/board'
  require '../lib/message'

  def initialize
    @turn = 1
    @winner = false
    @game_over = false

    @board = Board.new
    move
  end

  def move
    @board.show_board
    if @game_over
      if @winner
        Message.new(:winner, @turn)
      else
        Message.new(:tie)
      end
    else
      Message.new(:instruction)
      Message.new(:turn, @turn)
      field = gets.chomp
      play(field)
    end
  end

  def play(field)
    if field.length == 2 && "012".include?(field[0]) && "012".include?(field[1])
      insert = @board.insert(field, @turn)
      if insert == true
        @game_over = @board.game_ends
        @winner = @board.check_winner
        @turn = @turn == 1 ? 2 : 1 unless @game_over
      else
        Message.new(:not_empty)
      end
    else
      Message.new(:no_field)
    end
    move
  end
end

Game.new
