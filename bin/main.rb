#!/usr/bin/env ruby
# rubocop:disable Metrics/BlockLength

require_relative '../lib/game'
require_relative '../lib/player'

def message(text)
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
  Player.reset_count

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

    msg = 'Please enter the coordinates for your game'
    msg += "\nFor example, to fill the first box enter \nrow = 1 and column = 1"
    msg += "\nto fill the second box on the second row \nenter row = 2 and column = 2"
    
    loop do
      message(msg)

      loop do
        message("Player #{player.alias}[#{player.name}]")

        puts game.display_board

        message('Enter row number: ')
        row = gets.chomp
        game.row = row
        message('Enter column number: ')
        column = gets.chomp
        game.column = column

        if !game.valid?
          system('clear')
          message(msg)
          message("Rows and columns should be between 1 and 3\nPlease try again")
        elsif !game.board_nil?
          system('clear')
          message(msg)
          message("These row and column already exists\nPlease try again")
        else
          game.play(player.alias)
          break
        end
      end

      system('clear')

      message("Let's verify if your game is valid")

      message("Let's see if you are the winner")

      game.on = false if game.winner(player) == player || game.board_full?

      # change player turn
      if game.on
        player = player == player_x ? player_o : player_x
      end

      puts game.display_board

      break unless game.on
    end

    if game.winner(player).is_a?(Player)
      message("Winner is #{player.alias}[#{player.name}]")
    elsif game.board_full?
      message("Game has no winner")
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
  game = nil
end

# rubocop:enable Metrics/BlockLength
