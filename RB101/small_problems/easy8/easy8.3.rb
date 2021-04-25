# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. 
# The return value should be arranged in order from shortest to longest substring.

# Examples:

# leading_substrings('abc') == ['a', 'ab', 'abc']
# leading_substrings('a') == ['a']
# leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

def leading_substrings(string)
  array = []
  1.upto(string.size) {|count| array << string.slice(0, count)}
  array
end


#solution
def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end