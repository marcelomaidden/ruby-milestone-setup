#!/usr/bin/env ruby

loop do
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

    loop do
      puts '============================================'
      puts "Player #{player[1]}[#{player[0]}]"
      puts '============================================'
      puts 'Enter row number: '
      row = gets.chomp
      puts 'Enter column number: '
      column = gets.chomp
      row = row.to_i
      column = column.to_i

      puts "Let's verify if your game is valid"
      #create function to validate game
      puts '==========================================='
      puts 'Rows and column should be between 1 and 3'
      puts '==========================================='
      puts "Showing game board"
      #create function to display the game board

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

