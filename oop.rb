module Board
  
  def display(board)
    puts "Display the Board #{board}"
  end

  def make_board(rows)
    "Created Board with #{rows} rows"
  end

  def update_board
    "board updated"
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
    # puts "@game_rows = #{@game_rows}"
    if @game_rows == 8
      # puts "1.green\n2.blue\n3.yellow\n4.cyan\n5.purple\n6.brown"
      # puts "1.green 2.blue 3.yellow 4.cyan 5.purple 6.brown"
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

  attr_accessor :code_maker, :code_breaker, :board, :review,
  :game_count, :game_rows, :play, :player1, :player2, :secret_code,
  :computer_selection, :row_guess
  attr_reader :colour_pegs, :review_pegs

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

  def select_secret
    # selection of the secret code
    if @player1 == 'codemaker'
      puts "You are the #{@player1}"
      puts "The computer is the #{@player2}"
      puts
      # you choose the code
      @secret_code = get_selection
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
      @row_guess = []
      values = @colour_pegs.values
      #validate choice and get selection
      # @row_guess = get_selection
      selection = get_selection
      puts "Selection: #{selection}"
      # puts "Class is: #{selection.class}"
      # @row_guess = values.values_at(selection.to_i[])
      selection.each_char {|ch| @row_guess.push(values[ch.to_i - 1])}
      # puts "@row_guess = #{@row_guess}"
      # puts @row_guess
    else
      # computer is codebreaker so auto select
      @row_guess = get_autoselection
    end
  end

  def review_choice
    @review = []
    @row_guess.each_with_index do | i, idx|
      if (@secret_code.any?(i))
        secret_code_idx = @secret_code.find_index(i)
        idx == secret_code_idx ? @review.push(@review_pegs[:red]) : @review.push(@review_pegs[:white])
      end
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
          puts "Player1 (YOU) are codebreaker, select pegs for board"
          game.select_choice
          game.review_choice
          #check choice against secret code
          print "\tGuess: "
          game.row_guess.each {|x| print "#{x} " }
          print "\t Review: "
          game.review.each {|r| print "#{r} "}
          puts
          # display choice and feedback
          
          puts "Player2 (COMP) is codemaker, secret code: "
          # computer assess choice against secret code and update board on review
          # display board with feedback
          # if player choice matches secret code, break
          # game.secret_code.each {|peg| print peg + " "}
          puts
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
