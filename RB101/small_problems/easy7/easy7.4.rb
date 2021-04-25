# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by 
# its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

# Example:

# swapcase('CamelCase') == 'cAMELcASE'
# swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# I used a redunant #map on my solution after checking the official one. Lesson learned.
def swapcase(string)
  string.split.map do |word|
    word.split('').map do |letter|
      if letter == letter.downcase
        letter.upcase
      else
        letter.downcase
      end
    end.join('')
  end.join(' ')
end
#refactored version
def swapcase(string)
  string.split('').map do |letter|
      if letter == letter.downcase
        letter.upcase
      else
        letter.downcase
      end
    end.join('')
end

#solutiom
def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end


