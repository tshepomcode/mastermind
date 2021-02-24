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
      # @board = Board.make_board(@game_rows)
      # Board.make_board(rows)
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
    puts "Choose profile:\n1. Codemaker\n2. Codebreaker"
      choice = gets.chomp.to_i
      loop do
        case choice
        when 1
          player_one = 'codemaker'
          player_two = 'codebreaker'
          puts "Player 1 is the '#{players.first}'\nPlayer 2(computer) is the '#{players.last}'"
          break
        when 2
          players.shuffle!(random: Random.new(2))
          player_one = 'codebreaker'
          player_two = 'codemaker'
          puts "Player 1 is the #{players.first}\nPlayer 2(computer) is the #{players.last}"
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

end


class Mastermind
  include Board
  include Validator

  attr_accessor :code_maker, :code_breaker, :board, :review_pegs,
  :game_count, :game_rows, :play, :player1, :player2
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

end


# Games Main code starts here

puts "\t\tMasterMind Demo 1.0\n\n"

game = Mastermind.new()

while game.play == 'Y'

  games = Validator.get_games
  game.game_count = 0

  while game.game_count < games
    game.game_rows = game.get_rows

    game.board = game.make_board(game.game_rows)
    game.display(game.board)
    rows = 0

    game.choose_profile
    puts

    while game.game_rows != 0
      rows += 1
      puts "Row #:#{rows}"
      puts
      
      

      # code maker play
      

      game.game_rows -= 1
    end

    game.game_count += 1
  end

  game.play = game.get_play
  game.play == 'Y'? (puts "Let's play") : game.play = 'N'
end
