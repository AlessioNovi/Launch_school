# Write a method that returns a list of all substrings of a string that are palindromic. 
# That is, each substring must consist of the same sequence of characters forwards as it does backwards. 
# The return value should be arranged in the same sequence as the substrings appear in the string. 
# Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, 
#   "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

# Examples:

# palindromes('abcd') == []
# palindromes('madam') == ['madam', 'ada']
# palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
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

def palindromes(string)
  array = substrings(string)
  array.keep_if {|substring| substring == substring.reverse && substring.size > 1}
end

#solution
def palindromes(string)
  all_substrings = substrings(string)
  results = []
  all_substrings.each do |substring|
    results << substring if palindrome?(substring)
  end
  results
end

def palindrome?(string)
  string == string.reverse && string.size > 1
end