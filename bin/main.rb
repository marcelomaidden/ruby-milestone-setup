#!/usr/bin/env ruby
# rubocop:disable Metrics/BlockLength
loop do
  puts '#################################'
  puts '  Tic Tac Toe Game'
  puts "  Let's start"
  puts '#################################'
  puts "Enter the player X's name"
  name = gets.chomp
  player_x = [name, 'X']

  puts "Enter the player O's name"
  name = gets.chomp
  player_o = [name, 'O']

  player = player_x

  game_on = true

  board = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]

  winner = nil

  while game_on
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

      puts '============================================'
      puts 'Your game is'
      puts "#{row} - #{column}"
      puts '============================================'

      puts "Let's verify if your game is valid"
      # create function to validate game
      draw = row >= 1 && row <= 3 && column >= 1 && column <= 3
      if draw == false
        puts '==========================================='
        puts 'Rows and column should be between 1 and 3'
        puts '==========================================='
      else
        board[row][column] = player[1]
      end

      # Showing game board
      puts "#{board[0]} \n#{board[1]}\n#{board[2]}"

      puts "Let's see if you are the winner"
      # create function to verify winner

      # change player turn
      player = player == player_x ? player_o : player_x

      game_on = false if !board[0].all?(nil) && !board[1].all?(nil) && !board[2].all?(nil)
      game_on = false unless winner.nil?
    end

    puts "Winner is #{player[1]}"

    puts 'Do you wanna play again? [yes] [no]'
    wanna_play = gets.chomp

    break if wanna_play.upcase == 'NO'

    system('clear')

    puts 'Creating another game'
    # create function to start game
  end
end

# rubocop:enable Metrics/BlockLength
