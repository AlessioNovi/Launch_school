#Write a method that takes one argument, a string, 
#and returns a new string with the words in reverse order.


def reverse_sentence(arg)
  return arg if arg == ''
  string_array = arg.split(' ')
  last = string_array.pop
  first = string_array.shift
  string_array.push(first).unshift(last).join(" ")
end



puts reverse_sentence('') == '' #true
puts reverse_sentence('Hello World') == 'World Hello' #true
puts reverse_sentence('Reverse these words') == 'words these Reverse' #true

#solution
def reverse_sentence(string)
  string.split.reverse.join(' ')
end
