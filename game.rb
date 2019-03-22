# Tic Tac Toe Game Class
class Game
  def initialize
    @board = [
      ['   ', '   ', '   '],
      ['   ', '   ', '   '],
      ['   ', '   ', '   ']
    ]

    @turn = 1
    @game_over = false
    @winner = 0

    message
  end

  def show_board
    puts "\n      0     1     2     "
    puts '         |     |     '
    puts '  0  ' + @board[0].join(' | ')
    puts '    _____|_____|_____'
    puts '         |     |     '
    puts '  1  ' + @board[1].join(' | ')
    puts '    _____|_____|_____'
    puts '         |     |     '
    puts '  2  ' + @board[2].join(' | ')
    puts '         |     |     '
    puts ''
  end

  def message
    show_board
    if @game_over
      puts "Game over. Player #{@winner} wins."
      puts ''
    else
      puts 'Insert field to play e.g. a1'
      print "Player #{@turn}: "
      field = gets.chomp
      play(field)
    end
  end

  def play(field)
    if field.length == 2 && '012'.include?(field[0]) && '012'.include?(field[1])
      insert(field)
    else
      puts 'That field does not exist'
      message
    end
  end

  def insert(field)
    first = field[0].to_i
    second = field[1].to_i

    if @board[first][second] == '   '
      @board[first][second] = @turn == 1 ? ' O ' : ' X '
      @turn = @turn == 1 ? 2 : 1
    else
      puts 'The field is not empty.'
    end

    message
  end
end

Game.new
