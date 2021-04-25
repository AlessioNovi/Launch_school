# Given the array...
  
# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#           'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#           'flow', 'neon']
# Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in 
# them but in a different order. Your output should look something like this:

# ["demo", "dome", "mode"]
# ["neon", "none"]
# #(etc)

# can try to use and hash array like this:
# loop trough array
#   if the alphabeticcaly sorted word is included to one of the keys
#     append that word to its values array
#   othwerwise created a new key with that sorted word alongside that word as starting value within an array
#print out all the values when done

def anagrams(array)
  hash = {}
  array.each do |word|
    if hash.has_key?(word.chars.sort.join)
      hash[word.chars.sort.join] << word
    else
      hash[word.chars.sort.join] = [word]
    end
  end
  hash.each_value {|value| p value if value.size > 1 }
  # ["demo", "dome", "mode"]
  # ["neon", "none"]
  # #(etc)
end

#solution
result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |v|
  puts "------"
  p v
