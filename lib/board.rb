# Tic Tac Toe Game Class
class Board
  def initialize
    @board = Array.new(3).map { ['   '] * 3 }
  end

  def show_board
    puts "\n      0     1     2     "
    @board.each_index do |i|
      puts '         |     |     '
      print " #{i}   #{@board[i][0].nil? ? ' ' : @board[i][0]} |"
      print " #{@board[i][1].nil? ? ' ' : @board[i][1]} |"
      puts " #{@board[i][2].nil? ? ' ' : @board[i][2]}"
      puts '    _____|_____|_____' unless i == 2
    end
    puts '         |     |     '
    puts ''
  end

  def insert(field, turn)
    first = field[0].to_i
    second = field[1].to_i

    if @board[first][second] == '   '
      @board[first][second] = turn == 1 ? ' O ' : ' X '
      return true
    else
      return false
    end
  end

  def game_ends
    count = 0
    @board.each do |e|
      count += 1 if e.include?('   ')
    end

    count.zero? || check_winner
  end

  def check_winner
    combos = [
      [@board[0][0], @board[0][1], @board[0][2]],
      [@board[1][0], @board[1][1], @board[1][2]],
      [@board[2][0], @board[2][1], @board[2][2]],
      [@board[0][0], @board[1][0], @board[2][0]],
      [@board[0][1], @board[1][1], @board[2][1]],
      [@board[0][2], @board[1][2], @board[2][2]],
      [@board[0][0], @board[1][1], @board[2][2]],
      [@board[2][0], @board[1][1], @board[0][2]],
    ]

    combos.include?([' X ', ' X ', ' X ']) || combos.include?([' O ', ' O ', ' O '])
  end
end

Board.new
