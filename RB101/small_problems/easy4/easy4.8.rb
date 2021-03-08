=begin

Write a method that takes a String of digits, and returns the appropriate number as an integer. 
The String may have a leading + or - sign; 
if the first character is a +, your method should return a positive number; if it is a -, your 
method should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, 
such as String#to_i, Integer(), etc. You may, however, use the string_to_integer 
method from the previous lesson.

Examples
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100
=end

def string_to_integer(string)
  num = 0
  string.each_byte.with_index do |value, index|
    num += 10**(string.length - index) * (value - 48) / 10
  end
  num
end

def string_to_signed_integer(string)
  if string[0] == '+'
    string_to_integer(string[1..string.length])
  elsif string[0] == '-'
    -string_to_integer(string[1..string.length])
  else
    string_to_integer(string)
  end
end

#or

def string_to_signed_integer(string)
  symbol = ''
  if string[0] == '+' || string[0] == '-'
    symbol = string.slice!(0)
  end
  return string_to_integer(string) if symbol == '+' || symbol.empty?
  -string_to_integer(string)
end

#solution

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

