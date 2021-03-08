=begin

Problem 
Write a method that takes a String of digits, and returns the appropriate number as an integer. 
You may not use any of the standard conversion methods available in Ruby to convert a string to a number, 
such as String#to_i, Integer()

Things to consider:

we need to create an integer variable equal to zero and from there manage to construct
our integer version of the string. An hash with String,key / Integer,values pairs could be useful
extracting each string number ASCII value could be also a viable option
Examples
string_to_integer('4321') == 4321
string_to_integer('570') == 570

Data structure
  Integer 
  
Algorithm
Create an Hash with String,key / Integer,values pairs
SET variable num to 0
split string into array and iterate with index over to it
add to sum 10 ** (string.length - current index) * hash value / 10
return num

Code
=end

PAIRS = {"0" => 0,  "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5,
"6" => 6, "7" => 7, "8" => 8, "9" => 9}

def string_to_integer(string)
  num = 0
  string.split('').each.with_index do |value, index|
    num += 10 ** (string.length - index) * PAIRS[value] / 10
  end
  num
end

#or

def string_to_integer(string)
  num = 0
  string.each_byte.with_index do |value, index|
    num += 10 ** (string.length - index) * (value - 48) / 10
  end
  num
end

#solution

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end