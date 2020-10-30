class Game
  def initialize
    @board = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end

  def display_board
    puts "#{@board[0]} \n#{@board[1]}\n#{@board[2]}"
  end
end