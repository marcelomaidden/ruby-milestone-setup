class Game
  def initialize
    @board = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end

  def display_board
    puts "#{@board[0]} \n#{@board[1]}\n#{@board[2]}"
  end

  def is_valid?(row, column)
    return true if row >= 1 && row <= 3 && column >= 1 && column <= 3
  end

  def play(row, column, player)
    return false unless board_nil?(row, column)

    @board[row][column] = player
    true
  end
  
  def board_nil?(row, column)
    return false unless @board[row][column].nil?

    true
  end

  def game_on?
    false unless board[0].any?(nil) || board[1].any?(nil) || board[2].any?(nil)
  end
end