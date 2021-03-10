# guess = [ 1, 3, 4, 6]
# guess_2 = [4, 5, 4, 4]
# guess_3 = [1, 4, 4, 1]
# guess_4 = [2, 4, 6, 3]

# secret = [1, 1, 4, 3]
# review = []

# # guess_2.each_with_index do |e,i|
# #   puts "Guess element: #{e}, index: #{i}"
# #   e_s = secret.at(i)
# #   i_s = secret.find_index(e_s)
# #   puts "Secret element: #{e_s}, index: #{i_s}"
# #   puts
# # end

# guess_3.each_with_index do | e, i|
#   puts secret.find_all { |v| v == e }
# end




# b = Hash.new(0)

# guess_3.each do |v|
#   b[v] += 1
# end

# b.each do |k, v|
#   puts "#{k} appears #{v} times"
# end

# puts guess_4.uniq

# guess_4.uniq.count == guess_4.count ? (puts "Yes") : (puts "No")

# a = ["c", "b", "c", "b"]

# # p a.find_index('a')
# # p a.find_index('b')
# # p a.find_index('c')

# guess_hash = Hash.new(0)
# secret_hash = Hash.new(0)

# b_hash = Hash.new(0)

# a.each_with_index{|e,i| puts "Element: #{e}, Index: #{i}"}
# a.each_with_index{|e,i| b_hash[e] += i}

# b_hash.each_with_index{|k,v| puts "Key: #{k}, Value: #{v}"}

# => Element: a, Index: 0
# => Element: b, Index: 1
# => Element: c, Index: 2
# puts review

# colour_pegs = {
#   green: "\e[38;2;255;255;255m\e[48;2;0;128;0m  1  \e[0m",
#   blue: "\e[38;2;255;255;255m\e[48;2;0;0;255m  2  \e[0m",
#   yellow: "\e[38;2;255;255;255m\e[48;2;255;215;0m  3  \e[0m",
#   cyan: "\e[38;2;255;255;255m\e[48;2;0;255;255m  4  \e[0m",
#   purple: "\e[38;2;255;255;255m\e[48;2;128;0;128m  5  \e[0m",
#   brown: "\e[38;2;255;255;255m\e[48;2;165;42;42m  6  \e[0m"
# }

# review_pegs = {
#   white: "\e[38;2;0;0;0m\e[48;2;255;255;255m 0 \e[0m", #white
#   red: "\e[38;2;255;255;255m\e[48;2;255;0;0m 0 \e[0m"  # red
# }

# guess = [
#   "\e[38;2;255;255;255m\e[48;2;255;215;0m  3  \e[0m",
#   "\e[38;2;255;255;255m\e[48;2;0;255;255m  4  \e[0m",
#   "\e[38;2;255;255;255m\e[48;2;128;0;128m  5  \e[0m",
#   "\e[38;2;255;255;255m\e[48;2;0;128;0m  1  \e[0m"
# ]


# values = colour_pegs.values
# extra_values = []
# guess_values = []
# values.cycle(3) {|x| extra_values << x}
# values.cycle(3) {|x| guess_values << x}
# secret_code = extra_values.sample(4)
# guess_code = guess_values.sample(4)
# # puts "secret_code: #{secret_code}"
# puts
# puts "----- Secret Codes -----"
# secret_code.each {|s| print "#{s} "}
# puts "\n\n"
# puts "----- Guess Codes -----"
# guess_code.each {|s| print "#{s} "}
# puts "\n\n"

# # start of compare
# review_values = []

# # check for duplicates in guess
# guess_duplicates = Hash.new(0)
# guess_code.each {|g| guess_duplicates[g] += 1}
# puts "---- guess duplicates ---"
# guess_duplicates.each {|gd| puts "#{gd} " }
# puts "Any duplicates?"
# puts guess_duplicates.select {|k,v| v > 1}

def find_index 

end


a_g = [ "a", "a", "b" , "c"] # guess
b_s = ["a", "a", "c", "b"]  # secrect code
r = []



# puts a.map.with_index {|x, i| puts "x: #{x}, i: #{i}"}.compact
a_g.each_with_index { |x, i|

  puts "x: #{x} i: #{i}"
  mapped = b_s.map.with_index {|c,ix| ix if x == c}.compact
  puts "mapped: #{mapped}"
  if (mapped.empty?)
    puts "Nothing mapped: #{mapped}"
  else
    puts "Something mapped: #{mapped}. Let's do something"
    if(mapped.one?(i))
      puts "Guess x: #{x} i: #{i}\nSecret value: #{b_s.at(i)}"
      puts "Found matching value and position : RED!"
      puts
    else
      puts "-----------"
      puts "Found value but not position: WHITE!"
      puts "Guess x: #{x} i: #{i}\nSecret value: #{b_s.at(i)} is at index #{mapped}"
      puts
    end

    # check if position via index is the same.
  end
  
  
  

}

