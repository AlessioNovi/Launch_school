#Write a method that takes two arguments, a string and a positive integer, 
#and prints the string as many times as the integer indicates.

def repeat(string, num)
  num.times {puts string}
end

repeat('Hello',3)


#Write a method that takes one integer argument, which may be positive, 
#negative, or zero. This method returns true if the number's absolute value is 
#odd. You may assume that the argument is a valid integer value.

def is_odd?(num)
  puts num % 2 != 0
end
  
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true  

#Write a method that takes one argument, a positive integer, 
#and returns a list of the digits in the number.

def digit_list(number)
  number.to_s.split('').map {|x| x.to_i}
end  

  
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
    
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
