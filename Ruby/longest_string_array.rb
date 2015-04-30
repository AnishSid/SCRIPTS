def longest_word
    words = ['apple', 'pear', 'banana', 'plum']
      longest_word = words.inject do |memo,word|
            memo.length > word.length ? memo : word
              end
        puts longest_word
end

longest_word
