# frozen_string_literal: true

require_relative 'lib/game'

yee = GAME.new

puts 'Welcome to Tic Tac Toe. Each turn, enter two coordinates, separated by a comma [,] as shown in the grid below:'
puts "\r\n"
puts '0,0 | 0,1 | 0,2'
puts '1,0 | 1,1 | 1,2'
puts '2,0 | 2,1 | 0,2'