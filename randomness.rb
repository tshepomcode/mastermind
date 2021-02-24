# The code maker secret code
code_pegs = {
    green: "\e[38;2;0;128;0mgreen\e[0m",
    blue: "\e[38;2;138;43;226mblue\e[0m",
    yellow: "\e[38;2;255;255;0myellow\e[0m",
    cyan: "\e[38;2;0;255;255mcyan\e[0m",
    purple: "\e[38;2;128;0;128mpurple\e[0m",
    brown: "\e[38;2;168;42;42mbrown\e[0m",
}

values = code_pegs.values
# p "shuffled values : #{values.shuffle}"
# puts "---- Original array"
# puts values
# puts " ---- Extra Values ----"
extra_values = []
values.cycle(3) {|x| extra_values << x}
# puts extra_values
# puts "----- Shuffle ------"
# puts values.shuffle
puts "----- Secret Code -----"
secret_code = extra_values.sample(4)
puts secret_code



# create board with 8 - 12 rows and display
# lets start with 3 rows to test
rows = 3
board_1 = Array.new(rows) {|i| (1..4).to_a}
puts "board 1 = #{board_1}"

colour_choice = []
code_pegs.each_key {|key| colour_choice << key}

puts colour_choice

# select row 1 and update elements
#input values
puts "How to play:"
puts
puts "\tSelect the colour pegs in the order you want placed"
puts "\te.g. slot order is 1 2 3 4, if you select blue green cyan purple,"
puts "\tthe order will be: blue, green, cyan, purple"
puts
puts "Select number associated with the color seperated by space and press enter"
puts
puts "1.green\n2.blue\n3.yellow\n4.cyan\n5.purple\n6.brown"
selected = gets.chomp
#check selection -length and correct numbers

loop do
    if(selected.length != 4)
        puts "Four colours should be selected"
        selected = gets.chomp
    elsif(selected.to_i == 0)
        puts "Your selection must be numbers"
        selected = gets.chomp
    else
        break
    end
end

loop do
    selected.each_char do |n|
        if(!(1..6).cover?(n.to_i))
            puts "Select colours between 1-6"
            selected = gets.chomp
        end
    end
    break
end

puts selected.length
puts selected.class
