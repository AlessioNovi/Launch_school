#Write a method that takes one argument, a string containing one or more words, 
#and returns the given string with words that contain five or more characters reversed. 
#Each string will consist of only letters and spaces. 
#Spaces should be included only when more than one word is present.


def reverse_words(string)
  reversed_string = string.split(' ').each do |word|
    word.reverse! if word.size > 4
  end
  reversed_string.join(" ")
end


puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

#solution:

def reverse_words(string)
  words = []

  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word
  end

  words.join(' ')
end