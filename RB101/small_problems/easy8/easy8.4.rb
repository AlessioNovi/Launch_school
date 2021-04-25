# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where 
# in the string the substring begins. This means that all substrings that start at position 0 should come first, then 
# all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a 
# given position should be returned in order from shortest to longest.

# You may (and should) use the leading_substrings method you wrote in the previous exercise:

# Examples:

# substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]
  
def leading_substrings(string)
  array = []
  1.upto(string.size) {|count| array << string.slice(0, count)}
  array
end

def substrings(string)
  current_position = 0
  array = []
  while current_position < string.size
    array.concat(leading_substrings(string[current_position..-1]))
    current_position += 1
  end
  array
end

#solution
def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end
  results
end