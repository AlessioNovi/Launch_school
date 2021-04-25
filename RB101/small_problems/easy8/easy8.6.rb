# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. 
# Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is 
# divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

# Example:
# fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

def print_ending_n(num)
  case 
  when num % 3 == 0 && num % 5 == 0
    print "FizzBuzz"
  when num % 3 == 0
    print "Fizz"
  when num % 5 == 0
    print "Buzz"
  else
    print "#{num}"
  end
end

def fizzbuzz(starting_n, ending_n)
  starting_n.upto(ending_n) do |num|
    case
    when num == ending_n
      print_ending_n(num)
    when num % 3 == 0 && num % 5 == 0
      print "FizzBuzz, "
    when num % 3 == 0
      print "Fizz, "
    when num % 5 == 0
      print "Buzz, "
    else
      print "#{num}, "
    end
  end
end

#solution
def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case
  when number % 3 == 0 && number % 5 == 0
    'FizzBuzz'
  when number % 5 == 0
    'Buzz'
  when number % 3 == 0
    'Fizz'
  else
    number
  end
end