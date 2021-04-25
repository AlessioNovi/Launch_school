# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside 
# the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

# Examples:

# uppercase?('t') == false
# uppercase?('T') == true
# uppercase?('Four Score') == false
# uppercase?('FOUR SCORE') == true
# uppercase?('4SCORE!') == true
# uppercase?('') == true

def uppercase?(string)
  string = string.split(' ').join('')
  string.split('').all? {|word| word == word.upcase}
end

#solution, definetely overcomplicated mine but it's late so....
def uppercase?(string)
  string == string.upcase
end