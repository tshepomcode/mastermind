# select row 1 and update elements
#input values
# puts "How to play:"
# puts
# puts "\tSelect the colour pegs in the order you want placed"
# puts "\te.g. slot order is 1 2 3 4, if you select blue green cyan purple,"
# puts "\tthe order will be: blue, green, cyan, purple"
# puts
# puts "Select number associated with the color seperated by space and press enter"
# puts
puts "1.green\n2.blue\n3.yellow\n4.cyan\n5.purple\n6.brown"
selected = gets.chomp
#check selection -length and correct numbers

loop do
    if(selected.length != 4)
        puts "Four colours should be selected"
        selected = gets.chomp
    elsif(!((selected.split(//)).all? {|x| (x.to_i).between?(1,6)}))
        puts "Select colours between 1-6"
        selected = gets.chomp
    else
        puts "Correct selection - Update row"
        break
    end
end
select_arr = selected.split(//)

select_arr.all? {|x| (x.to_i).between?(1,6)} ? (puts "Yes") : (puts "Nope!")
p selected



# loop do
#     selected.each_char do |n|
#         if(!(1..6).cover?(n.to_i))
#             puts "Select colours between 1-6"
#             selected = gets.chomp
#         end
#     end
#     break
# end

# puts selected.length
# puts selected.class
