# Reverse the Digits In a Number
# Write a method that takes a positive integer as an argument and returns that number with its digits reversed. 
# Examples:
# reversed_number(12345) == 54321
# reversed_number(12213) == 31221
# reversed_number(456) == 654
# reversed_number(12000) == 21 # No leading zeros in return value!
# reversed_number(12003) == 30021
# reversed_number(1) == 1


def reversed_number(num)
  num.digits.each_with_object("") {|n, str| str << n.to_s}.to_i
end

#solution
def reversed_number(number)
  string = number.to_s
  reversed_string = string.reverse
  reversed_string.to_i
end