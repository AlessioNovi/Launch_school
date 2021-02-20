=begin
P

Write another method that returns true if the 
string passed as an argument is a palindrome, false otherwise. 
This time, however, your method should be case-insensitive, and it should ignore 
all non-alphanumeric characters. If you wish, you may simplify things by calling the palindrome? 
method you wrote in the previous exercise.

things to consider:
we must eliminate all non alphanumerics characters from the string
we must make our string without space if any are present
we must consider any uppercase characters

E
real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false

D
boolean

A

create CONSTANT with alphabet letters and numbers
iterate over string as an array and keep values if they are present in CONSTANT array
check if revised string with downcase is the same as its reversed versione

=end

VALID_CHARACTERS = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "1", "2", "3", "4", "5", "6", "7", "8,", "9", "0"]

def real_palindrome?(string)
  fixed_string = string.downcase.split('').keep_if { |value| VALID_CHARACTERS.include?(value) }.join
  fixed_string == fixed_string.reverse
end

#solution uses Regexp which i'm not familiar at this point. It defo makes lifes easier like this...

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

#a much better way to initiate a COSTANT for our problem (taken from student solution)
#ALPHANUMERIC_CHARS = [Array('a'..'z'),Array('0'..'9')]