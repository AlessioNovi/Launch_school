# Write a method that takes a string, and returns a new string in which every consonant character is doubled. 
# Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

# Examples:

# double_consonants('String') == "SSttrrinngg"
# double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# double_consonants("July 4th") == "JJullyy 4tthh"
# double_consonants('') == ""

def double_consonants(string)
  string.chars.map {|word| (/[aeiou]|\d|\W|\s/).match?(word) ? word : word * 2}.join
end

#solution
CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end