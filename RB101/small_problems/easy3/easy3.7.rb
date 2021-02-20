=begin

Problem 
Write a method that returns an Array that contains every other element 
of an Array that is passed in as an argument. The values in the returned list 
should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

Examples
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []

Data structure
  array
Algorithm
SET empty array
SET counter to 1

while counter is less than array size
  push element into empty array at index[counter -1]
  increase counter by 2
end

return newly populated array

Code
=end

def oddities(array)
  odd_elements = []
  counter = 0
  
  while counter < array.size
    odd_elements << array[counter]
    counter += 2
  end
odd_elements
end

# or

def oddities(array)
  new_arr = array.select.with_index { |value, index| index % 2 == 0 }
  new_arr
end 

#in case we want extract even nos

def evens(array)
  even_elements = []
  counter = 1
  
  while counter < array.size
    even_elements << array[counter]
    counter += 2
  end
even_elements
end

#or

def evens(array)
  new_arr = array.select.with_index { |value, index| index % 2 == 1 }
  new_arr
end
