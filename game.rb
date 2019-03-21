class Game
  @@board = [
    [' - ', ' - ', ' - '],
    [' - ', ' - ', ' - '],
    [' - ', ' - ', ' - ']
  ]

  def show_board
    puts ''
    puts '      a     b     c     '
    puts '         |     |     '
    puts '  1  ' + @@board[0].join(' | ')
    puts '    _____|_____|_____'
    puts '         |     |     '
    puts '  2  ' + @@board[1].join(' | ')
    puts '    _____|_____|_____'
    puts '         |     |     '
    puts '  3  ' + @@board[2].join(' | ')
    puts '         |     |     '
    puts '  '
  end

  def play(player, move)
  end
  
end

game = Game.new
game.show_board