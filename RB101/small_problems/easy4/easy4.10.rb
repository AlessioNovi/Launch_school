=begin
Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

Examples
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'
=end

def integer_to_string(int)
  int.digits.reverse.inject('') { |acc, value| acc << "#{value}" }
end

def signed_integer_to_string(int)
  string = integer_to_string(int.abs)
  
  if int < 0
    string.prepend('-')
  elsif int > 0
    string.prepend('+')
  else
    string
  end
end

    