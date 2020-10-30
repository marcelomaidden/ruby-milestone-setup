#!/usr/bin/env ruby
# rubocop:disable Metrics/BlockLength

require './game'
require './player'

loop do
  puts '#################################'
  puts '  Tic Tac Toe Game'
  puts "  Let's start"
  puts '#################################'

  game = Game.new

  puts "Enter the player X's name"
  name = gets.chomp
  player_x = Player.new(name)

  puts "Enter the player O's name"
  name = gets.chomp
  player_o = Player.new(name)

  player = player_x

  game.on = true

  while game.on
    system('clear')

    loop do
      puts "\n============================================"
      puts "Player #{player.alias}[#{player.name}]"
      puts '============================================'
      puts 'Enter row number: '
      game.set_row(gets.chomp)
      puts 'Enter column number: '
      game.set_column(gets.chomp)

      system('clear')

      puts "\n============================================"
      puts "Let's verify if your game is valid"
      puts '============================================'

      if !game.is_valid?
        puts "\n==========================================="
        puts 'Rows and column should be between 1 and 3'
        puts '==========================================='
      elsif !game.board_nil?
        puts "\n==========================================="
        puts 'These row and column already exists'
        puts '==========================================='
      else
        game.play(player.alias)
        puts "\n==========================================="
        puts "Let's see if you are the winner"
        puts "\n==========================================="

        game.on = false if game.winner(player) == player || game.board_full?

        # change player turn
        if game.on
          player = player == player_x ? player_o : player_x
        end
      end

      game.display_board

      "Board full: #{game.board_full?}"
      break unless game.on
    end

    if game.winner(player).is_a?(Player)
      puts "\n==========================================="
      puts "Winner is #{player.alias}[#{player.name}]"
      puts "\n==========================================="
    else
      puts "\n==========================================="
      puts 'There is no winner'
      puts "\n==========================================="
    end
  end

  wanna_play = ''
  
  loop do
    puts 'Do you wanna play again? [yes] [no]'
    wanna_play = gets.chomp
    break if wanna_play.upcase == 'YES' || wanna_play.upcase == 'NO'
  end
  
  break if wanna_play.upcase == 'NO'

  system('clear')
end

# rubocop:disable Metrics/BlockLength
