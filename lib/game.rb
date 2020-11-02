# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/AbcSize

class Game
  attr_accessor :on
  attr_reader :row, :column

  def initialize
    @board = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end

  def display_board
    "              Column
           1    2    3
    \n     1 - #{@board[0]}
    \n Row 2 - #{@board[1]}
    \n     3 - #{@board[2]}"
  end

  def row=(row)
    @row = row.to_i - 1
  end

  def column=(column)
    @column = column.to_i - 1
  end

  def valid?
    return true if @row >= 0 && @row <= 2 && @column >= 0 && @column <= 2
  end

  def play(player)
    return false unless board_nil?

    @board[@row][@column] = player
    true
  end

  def board_nil?
    return false unless @board[@row][@column].nil?

    true
  end

  def board_full?
    !(@board[0].any?(nil) || @board[1].any?(nil) || @board[2].any?(nil))
  end

  def winner(player)
    result = false
    @board.map do |r|
      result = player if r.all?(player.alias)
    end

    return player if result == player

    return player if @board[0][0] == player.alias && @board[1][1] == player.alias && @board[2][2] == player.alias

    return player if @board[0][2] == player.alias && @board[1][1] == player.alias && @board[2][0] == player.alias

    return player if @board[0][0] == player.alias && @board[1][0] == player.alias && @board[2][0] == player.alias

    return player if @board[0][1] == player.alias && @board[1][1] == player.alias && @board[2][1] == player.alias

    return player if @board[0][2] == player.alias && @board[1][2] == player.alias && @board[2][2] == player.alias
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/AbcSize
