
#Write a method that counts the number of occurrences of each 
#element in a given array.


  vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(array)

single_occurrences = array.uniq
occurences_array = []
counter = 0

while counter < single_occurrences.length
  number_of_single_multiple_single_occurrences = 
  array.count(single_occurrences[counter])
  occurences_array << number_of_single_multiple_single_occurrences
  puts "#{single_occurrences[counter]} => #{occurences_array[counter]} "
  counter += 1
end
end


count_occurrences(vehicles)
