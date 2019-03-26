require '../lib/board'
require '../lib/message'

# Class Game is the main class
class Game
  def initialize
    @turn = 1
    @winner = false

    @board = Board.new
    move
  end

  def check_game
    if @board.check_winner
      @board.show_board
      Message.new(:winner, @turn)
    elsif @board.board_full
      @board.show_board
      Message.new(:tie)
    else
      @turn = @turn == 1 ? 2 : 1
      move
    end
  end

  def move
    @board.show_board
    Message.new(:instruction)
    Message.new(:turn, @turn)
    field = gets.chomp
    play(field)
  end

  def play(field)
    if field.length == 2 && '012'.include?(field[0]) && '012'.include?(field[1])
      insert = @board.insert(field, @turn)
      if insert
        check_game
      else
        Message.new(:not_empty)
        move
      end
    else
      Message.new(:no_field)
      move
    end
  end
end
