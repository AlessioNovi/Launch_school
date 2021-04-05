=begin 
Write a method that takes a string argument and returns a new string that 
contains the value of the original string with all consecutive duplicate characters 
collapsed into a single character. You may not use String#squeeze or String#squeeze!.

Examples:
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
=end

def crunch(string)
  arr = []
  string.chars.each.with_index do |value, index|
    arr << string[index] unless string[index + 1] == value
  end
  arr.join('')
end

#solution

def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

