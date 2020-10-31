#!/usr/bin/env ruby
# rubocop:disable Metrics/BlockLength
# rubocop:disable Metrics/BlockNesting

require_relative '../lib/game'
require_relative '../lib/player'

def message(text)
  puts "\n============================================"
  puts text
  puts '============================================'
end
loop do
  puts '#################################'
  puts '  Tic Tac Toe Game'
  puts "  Let's start"
  puts '#################################'

  game = Game.new

  player_x = nil
  player_o = nil

  loop do
    puts "Enter the player X's name"
    name = gets.chomp
    player_x = Player.new(name)
    break if name.to_i.zero? && name != '0' && name.strip != ''

    system('clear')
    message('Only strings are allowed')
  end

  loop do
    puts "Enter the player O's name"
    name = gets.chomp
    player_o = Player.new(name)
    break if name.to_i.zero? && name != '0' && name.strip != ''

    system('clear')
    message('Only strings are allowed')
  end

  player = player_x

  game.on = true

  while game.on
    system('clear')

    loop do
      system('clear')

      message('Board full') if game.board_full?

      message("Player #{player.alias}[#{player.name}]")

      puts game.display_board

      message('Please enter the coordinates for your game')
      message("For example, to fill the first box enter \nrow = 1 and column = 1")
      message("to fill the second box on the second row \nenter row = 2 and column = 2")

      message('Enter row number: ')
      row = gets.chomp
      game.row = row
      message('Enter column number: ')
      column = gets.chomp
      game.column = column

      system('clear')

      message("Let's verify if your game is valid")

      if !game.valid?
        message('Rows and column should be between 1 and 3')
      elsif !game.board_nil?
        message('These row and column already exists')
      else
        game.play(player.alias)

        message("Let's see if you are the winner")

        game.on = false if game.winner(player) == player || game.board_full?

        # change player turn
        if game.on
          player = player == player_x ? player_o : player_x
        end
      end

      puts game.display_board

      break unless game.on
    end

    if game.winner(player).is_a?(Player)
      message("Winner is #{player.alias}[#{player.name}]")
    else
      message('There is no winner')
    end
  end

  wanna_play = ''

  loop do
    message('Do you wanna play again? [yes] [no]')
    wanna_play = gets.chomp
    break if wanna_play.upcase == 'YES' || wanna_play.upcase == 'NO'
  end

  break if wanna_play.upcase == 'NO'

  system('clear')
end

# rubocop:enable Metrics/BlockLength
# rubocop:enable Metrics/BlockNesting
