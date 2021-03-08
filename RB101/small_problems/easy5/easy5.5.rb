=begin
P
Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, 
write a method that returns that string with all of the non-alphabetic characters replaced by spaces. 
If one or more non-alphabetic characters occur in a row, you should only have one space in the result 
(the result should never have consecutive spaces).

E
cleanup("---what's my +*& line?") == ' what s my line '

D
string

A
SET variable and initialize it as split string into array with single characters
replace element with space if not alphabetic character

return joined array and squeeze it
=end

#C

def cleanup(string)
  cleaned_str = string.chars.each do |element|
    unless ('a'..'z').include?(element)
      element.replace ' '
    end
  end
 cleaned_str.join.squeeze
end


