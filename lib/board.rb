# Board Class
class Board
  attr_reader :board

  def initialize
    @board = Array.new(3).map { [nil] * 3 }
  end

  def show_board
    board = @board.map(&:clone) # make a copy of the board
    puts "\n      0     1     2     "
    board.each_index do |i|
      board[i].map! { |e| e.nil? ? ' ' : e } # replace nil with space
      puts '         |     |     '
      print " #{i}    #{board[i][0]}  |"
      print "  #{board[i][1]}  |"
      puts "  #{board[i][2]}"
      puts '    _____|_____|_____' unless i == 2
    end
    puts "         |     |     \n "
  end

  def insert(field, turn)
    first = field[0].to_i
    second = field[1].to_i

    if @board[first][second].nil?
      @board[first][second] = turn == 1 ? 'O' : 'X'
      return true
    else
      return false
    end
  end

  def board_full
    count = 0
    @board.each do |e|
      count += 1 if e.include?(nil)
    end

    count.zero?
  end

  def check_winner
    combos = []
    @board.map { |row| combos << row }
    @board.map.with_index do |row, row_idx|
      combos << @board.map { |row| row[row_idx] }
    end
    combos << @board.map.with_index { |row, i| row[i] }
    combos << @board.map.with_index { |row, i| row[row.length - 1 - i] }

    combos.include?(%w[X X X]) || combos.include?(%w[O O O])
  end
end
