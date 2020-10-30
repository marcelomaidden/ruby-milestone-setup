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
end