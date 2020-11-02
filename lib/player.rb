# rubocop:disable Style/ClassVars

class Player
  attr_reader :name, :alias

  @@count_player = 0

  def initialize(name)
    @name = name
    @@count_player = 0 if @@count_player == 3
    @@count_player += 1
    @alias = case @@count_player
             when 1
               'X'
             else
               'O'
             end
  end

  def self.reset_count
    @@count_player = 0
  end
end

# rubocop:enable Style/ClassVars
