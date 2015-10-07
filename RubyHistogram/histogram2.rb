bag = Hash.new(0)
$stdin.each do |line|
    line.chomp.downcase.gsub("/[^a-zA-Z\s]/", "").sub("/^\s+/", "").split(/ +/).each do |word|
        bag[word] += 1
    end
end

puts "Word : Frequency"
bag.each{|word, freq| puts "#{word} : #{freq}"}
puts "\nOnly frequencies >= 2"
puts "Word : Frequency"
bag.select{|word, freq| freq >= 2}.each do |word|
    puts "#{word[0]} : #{word[1]}"
end
