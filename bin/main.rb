#!/usr/bin/env ruby
require './game.rb'
require './player.rb'

loop do
  puts "#################################"
  puts "  Tic Tac Toe Game"
  puts "  Let's start"
  puts "#################################"

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

    game.display_board

    loop do
      puts "\n============================================"
      puts "Player #{player.alias}[#{player.name}]"
      puts '============================================'
      puts 'Enter row number: '
      row = gets.chomp
      puts 'Enter column number: '
      column = gets.chomp
      row = row.to_i
      column = column.to_i

      puts "\n============================================"
      puts "Let's verify if your game is valid"
      puts "============================================"

      if !game.is_valid?(row, column)
        system('clear')
        puts "\n==========================================="
        puts 'Rows and column should be between 1 and 3'
        puts '==========================================='
      elsif !game.board_nil?(row, column)
        system('clear')
        puts "\n==========================================="
        puts 'These row and column already exists'
        puts '==========================================='
      else 
        game.play(row - 1, column - 1, player.alias)
      end

      game.display_board

      puts "\n==========================================="
      puts "Let's see if you are the winner"
      puts "\n==========================================="
      game.on = false if game.winner(player) == player || game.board_full?

      
      puts "Board_full: #{game.board_full?}"

      break if !game.on
      #change player turn
      if game.on
        player = player == player_x ? player_o : player_x 
      end
    end

    if game.winner(player).is_a player
      puts "\n==========================================="
      puts "Winner is #{player.alias}"
      puts "\n==========================================="
    else
      puts "\n==========================================="
      puts "There is no winner"
      puts "\n==========================================="
    end

    puts "Do you wanna play again? [yes] [no]"
    wanna_play = gets.chomp

    break if wanna_play.upcase == 'NO'

    system('clear')

    puts "Creating another game"
  end
end

