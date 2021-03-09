

code_pegs = {
    green: "\e[38;2;0;128;0mgreen\e[0m",
    blue: "\e[38;2;138;43;226mblue\e[0m",
    yellow: "\e[38;2;255;255;0myellow\e[0m",
    cyan: "\e[38;2;0;255;255mcyan\e[0m",
    purple: "\e[38;2;128;0;128mpurple\e[0m",
    brown: "\e[38;2;168;42;42mbrown\e[0m"
}

code_pegs1 = {
    green: "\e[38;2;255;255;255m\e[48;2;0;128;0m  1  \e[0m",
    blue: "\e[38;2;255;255;255m\e[48;2;0;0;255m  2  \e[0m",
    yellow: "\e[38;2;255;255;255m\e[48;2;255;215;0m  3  \e[0m",
    cyan: "\e[38;2;255;255;255m\e[48;2;0;255;255m  4  \e[0m",
    purple: "\e[38;2;255;255;255m\e[48;2;128;0;128m  5  \e[0m",
    brown: "\e[38;2;255;255;255m\e[48;2;165;42;42m  6  \e[0m"
}

key_pegs = {
    white: "\e[38;2;255;255;255m0\e[0m", #white
    red: "\e[38;2;255;0;0m0\e[0m"         # red
}

key_pegs1 = {
    white: "\e[38;2;0;0;0m\e[48;2;255;255;255m 0 \e[0m", #white
    red: "\e[38;2;255;255;255m\e[48;2;255;0;0m 0 \e[0m"  # red
}

print "\e[32;38;4;1mgreen\e[0m \e[34;38;4;1mblue\e[0m \n"
print "white\t \e[38;2;0;0;0m\e[48;2;255;255;255m 0 \e[0m\n"
print "red\t \e[38;2;255;255;255m\e[48;2;255;0;0m 0 \e[0m\n"
# puts "\e[32mgreen\e[0m"
# puts "\e[34mblue\e[0m"
# puts "\e[31mred\e[0m"
# puts "\e[36mcyan\e[0m"
# puts "\e[33myellow\e[0m"
# puts "\e[35mmagenta\e[0m"
# puts "\e[35m0\e[0m"

# colours = [
#     "\e[32m0\e[0m",
#     "\e[34m0\e[0m",
#     "\e[31m0\e[0m",
#     "\e[36m0\e[0m",
#     "\e[33m0\e[0m",
#     "\e[35m0\e[0m"
# ]

puts "----- color pegs -----"
code_pegs.each { |key, value| print "#{value} "}
puts 

puts "----- color pegs 1-----"
code_pegs1.each { |key, value| print "#{value} "}
puts 

puts "----- key pegs -----"
key_pegs.each { |key, value| print "#{value} "}
puts

puts "----- key pegs 1 -----"
key_pegs1.each { |key, value| print "#{value} "}
puts
# colours = [
#     "\e[32mgreen\e[0m",
#     "\e[34mblue\e[0m",
#     "\e[38;2;255;0;0mred\e[0m",
#     "\e[36mcyan\e[0m",
#     "\e[33myellow\e[0m",
#     "\e[35mmagenta\e[0m",
#     "\e[38;2;128;0;0mmaroon\e[0m",
#     "\e[38;2;128;0;128mpurple\e[0m",
#     "\e[38;2;255;255;255mwhite\e[0m",
#     "\e[38;2;0;0;0mblack\e[0m"
# ]


# colours.each {|x| print "#{x} "}
# puts

# ESC[ 38;2;⟨r⟩;⟨g⟩;⟨b⟩ m Select RGB foreground color
# ESC[ 48;2;⟨r⟩;⟨g⟩;⟨b⟩ m Select RGB background color
# puts "--- Maroon ---"
# puts "\e[38;2;128;0;0mmaroon\e[0m"
# puts "--- Purple ---"
# puts "\e[38;2;128;0;128mpurple\e[0m"

# ESC[ 38;2;⟨r⟩;⟨g⟩;⟨b⟩ m Select RGB foreground color
# ESC[ 48;2;⟨r⟩;⟨g⟩;⟨b⟩ m Select RGB background color
print "\e[32;38;4;1m0\e[0m \e[34;48;4;1m0\e[0m \n"
puts "Yellow background with number:"
print "\e[48;2;255;255;0m  1\e[0m"
puts
print "green\t \e[38;2;255;255;255m\e[48;2;0;128;0m  1  \e[0m\n"
print "blue\t \e[38;2;255;255;255m\e[48;2;0;0;255m  2  \e[0m\n"
print "yellow\t \e[38;2;255;255;255m\e[48;2;255;215;0m  3  \e[0m\n"
print "cyan\t \e[38;2;255;255;255m\e[48;2;0;255;255m  4  \e[0m\n"
print "purple\t \e[38;2;255;255;255m\e[48;2;128;0;128m  5  \e[0m\n"
print "brown\t \e[38;2;255;255;255m\e[48;2;165;42;42m  6  \e[0m\n"

"\e[38;2;255;255;255m\e[48;2;0;128;0m  1  \e[0m\n"


# puts "\e[34;38;4;1mgreen\e[0m"
# puts "\e[37;44;4;1mMCC\e[0m"





    