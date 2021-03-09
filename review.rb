guess = [ 1, 3, 4, 6]
guess_2 = [4, 5, 4, 4]
guess_3 = [1, 4, 4, 1]
guess_4 = [2, 4, 6, 3]

secret = [2 ,4 ,6 , 2]
review = []

# b = Hash.new(0)

# guess_3.each do |v|
#   b[v] += 1
# end

# b.each do |k, v|
#   puts "#{k} appears #{v} times"
# end

puts guess_4.uniq

guess_4.uniq.count == guess_4.count ? (puts "Yes") : (puts "No")

a = ["c", "b", "c", "b"]

# p a.find_index('a')
# p a.find_index('b')
# p a.find_index('c')

guess_hash = Hash.new(0)
secret_hash = Hash.new(0)

b_hash = {}

a.each_with_index{|e,i| puts "Element: #{e}, Index: #{i}"}
a.each_with_index{|e,i| b_hash[e] = i}

b_hash.each_with_index{|k,v| puts "Key: #{k}, Value: #{v}"}

# => Element: a, Index: 0
# => Element: b, Index: 1
# => Element: c, Index: 2
# puts review