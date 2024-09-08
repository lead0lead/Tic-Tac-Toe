# frozen_string_literal: true

class GAME
  @@turn_count = 1
  @@winner = ''

  def initialize
    puts 'Player One, enter your name:'
    @player_one_name = gets.chomp
    puts 'Player Two, enter your name:'
    @player_two_name = gets.chomp
    @board = Array.new(3) { Array.new(3, '   ') }
  end

  def display_board(board)
    puts "\r"
    puts "#{board[0][0]} | #{board[0][1]} | #{board[0][2]}"
    puts "---------------"
    puts "#{board[1][0]} | #{board[1][1]} | #{board[1][2]}"
    puts "---------------"
    puts "#{board[2][0]} | #{board[2][1]} | #{board[2][2]}"
    puts "\r"
  end

  def player_turn(turn)
    if turn.odd?
      player_choice(@player_one_name, " O ")
    else
      player_choice(@player_two_name, " X ")
    end
  end

  def player_choice(player, symbol)
    puts "#{player}, enter coordinats separated by a comma."
    input = gets.chomp
    a_input = input.split(',')
    coord_one = a_input[0].to_i
    coord_two = a_input[1].to_i

    until input.match(/,/) && coord_one.between?(0,2) && coord_two.between?(0,2) && @board[coord_one][coord_two] == '   '
      puts 'Please enter valid coordinates of an empty space on the grid.'

      input = gets.chomp
      a_input = input.split(',')
      coord_one = a_input[0].to_i
      coord_two = a_input[1].to_i
    end

    add_to_board(coord_one, coord_two, symbol)
  end

  def add_to_board(coord_one, coord_two, symbol)
    @board[coord_one][coord_two] = symbol
    @@turn_count += 1
  end

  def horizontal_end
    @board.each do |i|
      if i.all? { |j| j ==' X ' }
        @@winner = ' X '
        @@turn_count = 10
      elsif i.all? { |j| j == ' O ' }
        @@winner = ' O '
        @@turn_count = 10
      else
        nil
      end
    end
  end

  def vertical_end
    board_flat = @board.flatten
    board_flat.each_with_index do |v, i|
      if v == ' X ' && board_flat[i + 3] == ' X ' && board_flat[i + 6] == ' X '
        @@winner = ' X '
        @@turn_count = 10
      elsif v == ' O ' && board_flat[i + 3] == ' O ' && board_flat[i + 6] == ' O '
        @@winner = ' O '
        @@turn_count = 10
      else
        nil
      end
    end
  end

  def diagonal_end
    center_value = @board[1][1]
    if center_value == ' X ' || center_value == ' O '
      if @board[0][0] && @board[2][2] == center_value
        @@winner = center_value
        @@turn_count = 10
      elsif @board[2][0] && @board [2][0] == center_value
        @@winner = center_value
        @@turn_count = 10
      else
        nil
      end
    end
  end

  def declare_result(symbol)
    case symbol
    when ' O '
      puts "#{@player_one_name} wins the game!"
    when ' X '
      puts "#{player_two_name} wins the game!"
    else
      puts "It's a tie!"
    end
  end

  def play_game
    display_board(@board)
    until @@turn_count >= 10 do
      player_turn(@@turn_count)
      horizontal_end
      vertical_end
      diagonal_end
      display_board(@board)
    end

    declare_result(@@winner)
  end

end