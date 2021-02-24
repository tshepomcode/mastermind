module Board
  
  def self.display
    puts "Display the Board"
  end

  def self.make_board(rows)
    puts "Created Board with #{rows} rows"
  end

end

class Mastermind
    attr_accessor :code_maker, :code_breaker, :board, :review_pegs,
    :game_count, :game_rows, :play, :player_1, :player_2
    attr_reader :colour_pegs, :code_pegs

    def initialize
        @game_count, @game_rows = 0
        @player_one, @player_two = ''
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

    include Board

    def check_play
      loop do
        unless (@play == 'Y' || @play == 'N')
          puts "Please enter 'y','n', 'Y' or 'N':"
          @play = gets.chomp
          @play.upcase!
        else
            break
        end
      end
    end

    def check_rows
      loop do
        case @game_rows
        when 8..12
        # @board = Board.make_board(@game_rows)
        Board.make_board(@game_rows)
        break
        
        else
          puts "Choose between 8 and 12"
          @game_rows = gets.chomp.to_i
        end
      end
    end

end


# Games Main code starts here

puts "\t\tMasterMind Demo 1.0\n\n"

game = Mastermind.new()

while game.play == 'Y'

  puts "Enter how many games to play: "
  games = gets.chomp.to_i
  puts

  while game.game_count < games
    puts "Enter the number of rows (8 - 12)"
    game.game_rows = gets.chomp.to_i
    game.check_rows

    game.game_count += 1
  end

  puts "Play Again?(Y/N):"
  game.play = gets.chomp
  game.play.upcase!
  game.check_play
end
