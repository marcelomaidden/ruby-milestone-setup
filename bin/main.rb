#!/usr/bin/env ruby
require './game.rb'

loop do
  game = Game.new

  puts "#################################"
  puts "  Tic Tac Toe Game"
  puts "  Let's start"
  puts "#################################"
  puts "Enter the player X's name"
  name = gets.chomp
  player_x = [name, 'X']

  puts "Enter the player O's name"
  name = gets.chomp
  player_o = [name, 'O']

  player = player_x

  tries = 0

  while tries < 9
    system('clear')

    game.display_board

    loop do
      puts "\n============================================"
      puts "Player #{player[1]}[#{player[0]}]"
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
        game.display_board
        puts "\n==========================================="
        puts 'Rows and column should be between 1 and 3'
        puts '==========================================='
      elsif !game.board_nil?(row, column)
        system('clear')
        game.display_board
        puts "\n==========================================="
        puts 'These row and column already exists'
        puts '==========================================='
      else 
        game.play(row - 1, column - 1, player[1])
      end

      puts "Let's see if you are the winner"
      #create function to verify winner

      #change player turn
      player = player == player_x ? player_o : player_x

      tries += 1

      break if tries == 9
    end

    puts "Winner is #{player[1]}"

    puts "Do you wanna play again? [yes] [no]"
    wanna_play = gets.chomp

    break if wanna_play.upcase == 'NO'

    system('clear')

    puts "Creating another game"
    #create function to start game
  end
end

