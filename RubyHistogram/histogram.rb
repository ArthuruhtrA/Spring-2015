$stdin.each do |line|
    line.chomp.downcase.gsub("/[^a-zA-Z\s]/", "").sub("/^\s+/", "").split(/ +/).each do |word|
        puts word
    end
end
