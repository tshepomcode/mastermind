require 'pry'

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
          break
        when 2
          players.shuffle!(random: Random.new(2))
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
    # puts "@game_rows = #{@game_rows}"
    if @game_rows == 8
    end
    
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
            break
        end
    end
    return selected
  end
end


class Mastermind
  # include Board
  include Validator

  attr_accessor :code_maker, :code_breaker, :board, :review,
  :game_count, :game_rows, :play, :player1, :player2, :secret_code,
  :computer_selection, :row_guess, :win
  attr_reader :colour_pegs, :review_pegs

  def initialize
      @game_count, @game_rows = 0
      @player1, @player2 = ""
      @play = "Y"

      @colour_pegs = {
        green: "\e[38;2;255;255;255m\e[48;2;0;128;0m  1  \e[0m",
        blue: "\e[38;2;255;255;255m\e[48;2;0;0;255m  2  \e[0m",
        yellow: "\e[38;2;255;255;255m\e[48;2;255;215;0m  3  \e[0m",
        cyan: "\e[38;2;255;255;255m\e[48;2;0;255;255m  4  \e[0m",
        purple: "\e[38;2;255;255;255m\e[48;2;128;0;128m  5  \e[0m",
        brown: "\e[38;2;255;255;255m\e[48;2;165;42;42m  6  \e[0m"
    }

      @review_pegs = {
        white: "\e[38;2;0;0;0m\e[48;2;255;255;255m 0 \e[0m", #white
        red: "\e[38;2;255;255;255m\e[48;2;255;0;0m 0 \e[0m"  # red
      }
  end

  def choose_profile
    # players = get_profile
    @player1 = "codebreaker"
    @player2 = "codemaker"
  end

  def select_secret
    # selection of the secret code
    if @player1 == 'codemaker'
      puts
      # you choose the code
      @secret_code = get_selection
    else
      puts "\tYou are the #{@player1}"
      puts "\tThe computer is the #{@player2}"
      puts
      values = @colour_pegs.values
      extra_values = []
      values.cycle(3) {|x| extra_values << x}
      # puts "----- Secret Code -----"
      @secret_code = extra_values.sample(4)
      # puts @secret_code
    end
  end

  def select_choice
    if player1 == 'codebreaker'
      @row_guess = []
      values = @colour_pegs.values
      #validate choice and get selection
      selection = get_selection
      selection.each_char {|ch| @row_guess.push(values[ch.to_i - 1])}
    else
      # computer is codebreaker so auto select
      @row_guess = get_autoselection
    end
  end

  def review_choice
    
    @review = []
    if @row_guess == @secret_code 
       @win = true
    else
      @row_guess.each_with_index do | x, i|
        mapped = @secret_code.map.with_index { |c, cix| cix if x == c}.compact
        # puts "mapped: #{mapped}"
        if(mapped.empty?)
          # puts "Nothing found"
        else
          # puts "Found something mapped: #{mapped}"
          if(mapped.one?(i))
            # puts "Found value and position"
            @review.push(@review_pegs[:red])
          else
            # puts "Found value not position"
            @review.push(@review_pegs[:white])
          end
        end
      end
    end
    
    # binding.pry
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
    puts "How to choose the colours to guess the hidden code:"
    puts
    puts "\tSelect the colour pegs in the order you want placed"
    puts "\t1.green 2.blue 3.yellow 4.cyan 5.purple 6.brown"
    puts "\te.g. if you select 2145, the order will be as follows:"
    puts "\t#{@colour_pegs[:blue]} #{@colour_pegs[:green]} #{@colour_pegs[:cyan]} #{@colour_pegs[:purple]}."
    # print "\t#{@colour_pegs[:blue]} #{@colour_pegs[:green]} #{@colour_pegs[:cyan]} #{@colour_pegs[:purple]}"

    puts
  end

  def maker_instructions
    puts "How to select a secret code:"
    puts
    puts "\tSelect the colour pegs in the order you want placed"
    puts "\t1.green 2.blue 3.yellow 4.cyan 5.purple 6.brown"
    puts "\te.g. if you select 2145, the order will be as follows:"
    puts "\t#{@colour_pegs[:blue]} #{@colour_pegs[:green]} #{@colour_pegs[:cyan]} #{@colour_pegs[:purple]}."

    puts
  end

  def winner
    @secret_code == @row_guess ? @win = true : @win = false
  end
end

# Games Main code starts here

puts "\t\tMasterMind Demo 1.0\n\n"
puts "\tIn Mastermind, the code maker cooks up a \n"
puts "\tcode with four colored code pegs and challenges\n"
puts "\tthe code breaker to solve and replicate that code.\n"
puts "\tthe code maker passes hints with the key pegs. The \n"
puts "\tcode breaker takes the hint to figure out how accurate\n"
puts "\ttheir guessed combination was and narrow down the possibilities.\n\n"

game = Mastermind.new()

while game.play == 'Y'
  # Choose number of games to play
  games = Validator.get_games

  game.game_rows = game.get_rows
  # game.board = game.make_board(game.game_rows)  
  puts

  # Choose whether codemaker or codebreaker
  game.choose_profile

  # Go through each game
  games.times do |game_num|
    puts "\t\tGAME # #{game_num + 1}"
    puts "\n\n"
    game.win = false
    # code maker to select code
    game.select_secret
    puts

    game.player1 == 'codebreaker' ? game.breaker_instructions : game.maker_instructions

    # game.display(game.board)
    # puts

    game.game_rows.times do |row|
      puts "Row #:#{row + 1}"
      puts

      # code breaker place colour selection on board
      case game.player1
        when 'codebreaker'
          # puts "Player1 (YOU) are codebreaker, select pegs for board"
          game.select_choice
          game.review_choice
          game.winner
          if (game.win)
            puts "\t\tYou solved it! Well done!"
            puts
            puts "\t\t--- Your Guess ----"
            print "\t\t"
            game.row_guess.each {|x| print "#{x} "}
            puts
            puts "\t\t--- Secret Code ---"
            print "\t\t"
            game.secret_code.each {|x| print "#{x} "}
            puts "\n\n"
            break
          elsif(row == 7 && !game.win)
            puts "\t\t SORRY YOU LOSE! :("
            puts
            print "\tGuess: "
            game.row_guess.each {|x| print "#{x} "}
            print "\t\t Review: "
            game.review.each {|r| print "#{r} "}
            puts
            puts "\t\t--- Secret Code ---"
            print "\t\t"
            game.secret_code.each {|x| print "#{x} "}
            puts "\n\n"
            break
            break
          else
            # puts "Game row: #{row}"
            print "\tGuess: "
            game.row_guess.each {|x| print "#{x} "}
            print "\t Review: "
            game.review.each {|r| print "#{r} "}
            puts "\n\n"
          end
          #check choice against secret code
        when 'codemaker'
          puts "Player1 (YOU) are codemaker, select your secret code"
          # game.select_choice
          puts "Player2 (COMP) are codebreaker, select pegs for board"
          game.get_autoselection
          game.review_choice
        else
        puts "Error: something went wrong with #{game.player1}"
      end
    end
  end

  game.play = game.get_play
  game.play == 'Y'? (puts "Let's play") : game.play = 'N'
end
