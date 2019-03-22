# Tic Tac Toe Game Class
class Game
  def initialize
    @board = [
      [' - ', ' - ', ' - '],
      [' - ', ' - ', ' - '],
      [' - ', ' - ', ' - ']
    ]

    @turn = 1
    @game_over = false
    @winner = 0

    message
  end

  def show_board
    puts "\n      a     b     c     "
    puts '         |     |     '
    puts '  1  ' + @board[0].join(' | ')
    puts '    _____|_____|_____'
    puts '         |     |     '
    puts '  2  ' + @board[1].join(' | ')
    puts '    _____|_____|_____'
    puts '         |     |     '
    puts '  3  ' + @board[2].join(' | ')
    puts "         |     |     \n"
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
    if field.length == 2 && 'abc'.include?(field[0]) && '123'.include?(field[1])
      insert(field)
    else
      puts 'That field does not exist'
      message
    end
  end

  def insert(field)
    letter = field[0]
    number = field[1]
  end
end

Game.new
