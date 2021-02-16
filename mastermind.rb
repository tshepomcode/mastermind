module Board
  
  def self.display
    puts "Display the Board"
  end

  def self.make_board(rows)
    puts "Created Board with #{rows} rows"
  end

end

## Players to choose where codemaker or codebreaker

puts "\t\tMasterMind Demo 1.0\n\n"
play = 'Y'
player_one, player_two = ''
games_count = 0

puts "Welcome!"
puts

## Game loop starts here

while play == 'Y'
  
  puts "Enter how many games to play: "
  games = gets.chomp.to_i
  puts

  while games_count < games
    puts "Enter the number of rows (8 - 12)"
    number_rows = gets.chomp.to_i
    loop do
      case number_rows
      when 8..12
        Board.make_board(number_rows)
        break
      else
        puts "Choose between 8 and 12"
        number_rows = gets.chomp.to_i
      end
    end

    puts "Choose profile:\n1. Codemaker\n2. Codebreaker"
    choice = gets.chomp.to_i
    loop do
      case choice
      when 1
        player_one = 'codemaker'
        player_two = 'codebreaker'
        puts "Player 1 is the '#{player_one}'\nPlayer 2(computer) is the '#{player_two}'"
        break
      when 2
        player_one = 'codebreaker'
        player_two = 'codemaker'
        puts "Player 1 is the #{player_one}\nPlayer 2(computer) is the #{player_two}"
        break
      else
        puts "Choose either 1 or 2"
        choice = gets.chomp.to_i
      end
    end
    games_count += 1
  end

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

  play == 'Y'? (puts "resume play") : play = 'N'
end









# Choose (1) codemaker or (2) comebreaker
# Choose number of games to play (best of 3?)
# Choose number of rows (8 - 12)

#### To make the game challenging, should we allow:
#### -  repeat colours for code maker or only unique colours?
#### -  response (review) from codemaker in order or out of order
####    selection? That is, position 1 review 1 colour 1
#### -  

# Begin game

# (Game 1 of 3)
## Setup Board of (8?) rows

# -> codemaker 
#   -   codemaker must place 4 colour code pegs to be broken/guessed
# (Row 1 of 8?)
# -> code breaker to enter first row of guesses (4 colour pegs)
#   -   after guess, codemaker must place(review?) 
#       - white peg if : correct colour but wrong position
#       - black peg if : correct colour and correct position
#       - no pegs for no matches
#   -   if (all 4 placements are correct)
#           codebreaker wins
#           break (next game 2 of 3)
#       else
#           Provide feedback (white, black or no pegs)
#           play continues
# (Row 2 of 8?)
#   -   Display feedback from codemaker (white, black or no peg)
# -> code breaker to enter second row of guesses (4 colour pegs)
#    -   codemaker must place(review?) (white, black, no peg)
#       - if (correct [slot1, slot2, slot3, slot4])
#           codebreaker wins
#           break (next game 3 of 3)
#        


## Setup Board of 8 rows
