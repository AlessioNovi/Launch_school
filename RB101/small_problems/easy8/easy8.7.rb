# Write a method that takes a string, and returns a new string in which every character is doubled.

# Examples:

# repeater('Hello') == "HHeelllloo"
# repeater("Good job!") == "GGoooodd  jjoobb!!"
# repeater('') == ''

def repeater(string)
  string.chars.map {|word| word * 2}.join
end

#solution
def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end