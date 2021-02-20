=begin
P
Write a method that returns true if the string passed as an 
argument is a palindrome, false otherwise. A palindrome reads 
the same forward and backward. For this exercise, case matters as does punctuation and spaces.

E

palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true

D

boolean

A

check if passed is the same as reversed string

C
=end

def palindrome?(string)
  string == string.reverse
end


