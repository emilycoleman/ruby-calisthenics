module FunWithStrings
  def palindrome?
    self.downcase!
    self.gsub!(/[^0-9a-z]/i, '')
    revstr = self.reverse
    return true unless self != revstr
  end
  def count_words
    words = Hash.new(0)
    self.downcase!
    self.gsub!(/[^0-9a-z ]/i, '')
    sentence = self.split
    sentence.each do |word|
      words[word] += 1
    end
    return words
  end
  def anagram_groups
    return_array = Array.new
    self.downcase!
    words = self.split
    
    words.each do |word|
      is_matched = false
      return_array.each do |category|
        category.each do |head|
          if head.chars.sort.join == word.chars.sort.join && head != word
            is_matched = true
            category.push(word)
          end
        end
      end
      
      if !is_matched
        new_array = [word]
        return_array.push(new_array)
      end
    end
    
    return return_array
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
