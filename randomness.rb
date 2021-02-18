# The code maker select a code
code_pegs = {
    green: "\e[38;2;0;128;0mgreen\e[0m",
    blue: "\e[38;2;138;43;226mblue\e[0m",
    yellow: "\e[38;2;255;255;0myellow\e[0m",
    cyan: "\e[38;2;0;255;255mcyan\e[0m",
    purple: "\e[38;2;128;0;128mpurple\e[0m",
    brown: "\e[38;2;168;42;42mbrown\e[0m"
}

values = code_pegs.values
# p "shuffled values : #{values.shuffle}"
puts values
puts "----- Shuffle ------"
puts values.shuffle
puts "----- Secret Code -----"
secret_code = values.sample(4)
puts secret_code
# create board with 8 - 12 rows and display
# lets start with 8 rows to test

