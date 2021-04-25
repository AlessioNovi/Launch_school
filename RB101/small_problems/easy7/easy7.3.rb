# Write a method that takes a single String argument and returns a new string that contains the original value of the argument 
# with the first character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

# Examples

# word_cap('four score and seven') == 'Four Score And Seven'
# word_cap('the javaScript language') == 'The Javascript Language'
# word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

#using !method to work on same string as #each returns itself and #capitalize returns a new string 
def word_cap(string)
  string.split.each {|word| word.capitalize!}.join(' ')
end

# Further exploration. Just worked on one alternate solution
def word_cap(string)
  words_array = string.split
  words_array.each do |word|
    word.downcase!
    word[0] = word[0].upcase
  end.join(' ')
end

#Solution

def word_cap(words)
  words_array = words.split.map do |word|
    word.capitalize
  end
  words_array.join(' ')
end

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end



