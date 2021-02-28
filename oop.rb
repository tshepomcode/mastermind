module Board
  
  def display(board)
    puts "Display the Board #{board}"
  end

  def make_board(rows)
    "Created Board with #{rows} rows"
  end

end

module Validator
  def get_rows
    puts "Enter the number of rows (8 - 12)"
    rows = gets.chomp.to_i

    loop do
      case rows
      when 8..12
        break
      else
        puts "Choose between 8 and 12"
        rows = gets.chomp.to_i
      end
    end
    return rows
  end

  def get_play()
    puts "Play Again?(Y/N):"
    play = gets.chomp
    play.upcase!
    loop do
      unless (play == 'Y' || play == 'N')
        puts "Please enter 'y','n', 'Y' or 'N':"
        play = gets.chomp
        play.upcase!
      else
          break
      end
    end
    return play
  end

  def get_profile
    players = ["codemaker", "codebreaker"]
    puts "Choose your player profile:\n1. codemaker\n2. codebreaker"
      choice = gets.chomp.to_i
      loop do
        case choice
        when 1
          # player_one = 'codemaker'
          # player_two = 'codebreaker'
          # puts "Player1 is the '#{players.first}'\nPlayer2(computer) is the '#{players.last}'"
          break
        when 2
          players.shuffle!(random: Random.new(2))
          # player_one = 'codebreaker'
          # player_two = 'codemaker'
          # puts "Player1 is the '#{players.first}'\nPlayer2(computer) is the '#{players.last}'"
          break
        else
          puts "Choose either 1 or 2"
          choice = gets.chomp.to_i
        end
      end
      return players
  end

  def self.get_games
    puts "Enter how many games to play: "
    games = gets.chomp.to_i

    loop do
      unless ((games.is_a? Integer) && games > 0)
        puts "Enter number greater than zero"
        games = gets.chomp.to_i
      else
        break
      end
    end
    return games
  end

  # select colours of row for human codebreaker
  def get_selection
    puts "Select your colours and press enter:"
    puts "1.green\n2.blue\n3.yellow\n4.cyan\n5.purple\n6.brown"
    selected = gets.chomp

    #check selection -length and correct numbers
    loop do
        if(selected.length != 4)
            puts "Only four colours should be selected"
            selected = gets.chomp
        elsif(!((selected.split(//)).all? {|x| (x.to_i).between?(1,6)}))
            puts "Select colours between 1-6"
            selected = gets.chomp
        else
            # puts "Correct selection - Update row"
            break
        end
    end
    return selected
  end
end


class Mastermind
  include Board
  include Validator

  attr_accessor :code_maker, :code_breaker, :board, :review_pegs,
  :game_count, :game_rows, :play, :player1, :player2, :secret_code,
  :computer_selection
  attr_reader :colour_pegs, :code_pegs

  def initialize
      @game_count, @game_rows = 0
      @player1, @player2 = ""
      @play = "Y"

      @colour_pegs = {
          green: "\e[38;2;0;128;0mgreen\e[0m",
          blue: "\e[38;2;138;43;226mblue\e[0m",
          yellow: "\e[38;2;255;255;0myellow\e[0m",
          cyan: "\e[38;2;0;255;255mcyan\e[0m",
          purple: "\e[38;2;128;0;128mpurple\e[0m",
          brown: "\e[38;2;168;42;42mbrown\e[0m"
      }

      @review_pegs = {
          white: "\e[38;2;255;255;255mwhite\e[0m",
          red: "\e[38;2;255;0;0mred\e[0m"
      }
  end

  def choose_profile
    players = get_profile
    @player1 = players.first
    @player2 = players.last
  end

  def select_code
    if @player1 == 'codemaker'
      puts "You are the #{@player1}"
      puts "The computer is the #{@player2}"
      puts
      # you choose the code
      @secret_code = "1234"
    else
      puts "You are the #{@player1}"
      puts "The computer is the #{@player2}"
      puts
      values = @colour_pegs.values
      extra_values = []
      values.cycle(3) {|x| extra_values << x}
      puts "----- Secret Code -----"
      @secret_code = extra_values.sample(4)
      puts @secret_code
    end
  end

  def select_choice
    if player1 == 'codebreaker'
      #validate choice and get selection
      @row_guess = get_selection
    else
      # computer is codebreaker so auto select
      @row_guess = get_autoselection
    end
  end

  def get_autoselection
    values = @colour_pegs.values
    extra_values = []
    values.cycle(3) {|x| extra_values << x}
    puts "----- Computer Row Selection -----"
    @computer_selection = extra_values.sample(4)
    puts @computer_selection
  end

  def breaker_instructions
    puts "How to play:"
    puts
    puts "\tSelect the colour pegs in the order you want placed"
    puts "\te.g. slot order is 1234, if you select blue green cyan purple,"
    puts "\tthe order selection will be 2145."

    puts
  end

  def maker_instructions
    puts "How to select secret code:"
    puts
    puts "\tSelect the colour pegs in the order you want placed"
    puts "\te.g. colour order is 1234, if you select blue green cyan purple,"
    puts "\tthe order selection will be 2145 for your code."

    puts
  end
end

# Games Main code starts here

puts "\t\tMasterMind Demo 1.0\n\n"

game = Mastermind.new()

while game.play == 'Y'
  # Choose number of games to play
  games = Validator.get_games

  game.game_rows = game.get_rows
  game.board = game.make_board(game.game_rows)  
  puts

  # Choose whether codemaker or codebreaker
  game.choose_profile

  # if player1 (you) is codemaker, select secret code, computer select peg to place on board
  # else player1(You) is codebreaker, select pegs to place on the board, computer select secret code

  # Go through each game
  games.times do |game_num|
    puts "Game # #{game_num + 1}"
    puts
    # code maker to select code
    game.select_code
    puts

    game.player1 == 'codebreaker' ? game.breaker_instructions : game.maker_instructions

    game.display(game.board)
    puts

    game.game_rows.times do |row|
      puts "Row #:#{row + 1}"
      puts

      # code breaker place colour selection on board
      case game.player1
        when 'codebreaker'
          puts "Player1 (YOU) are codebreaker, select pegs for board"
          puts "Player2 (COMP) are codemaker, secret code: "
          game.secret_code.each {|peg| print peg}
          # Computer select secret code
          # game.select_code
        when 'codemaker'
          puts "Player1 (YOU) are codemaker, select your secret code"
          puts "Player2 (COMP) are codebreaker, select pegs for board"
        else
        puts "Error: something went wrong with #{game.player1}"
      end

      # code maker assess then return review/result#n

      # DISPLAY THE BOARD and REVIEW/RESULT
      # if correct (WELL DONE!) break out of game
      # else give review and load next row
      
    end
  end

  game.play = game.get_play
  game.play == 'Y'? (puts "Let's play") : game.play = 'N'
end
