=begin

Write a method that takes an Array of numbers, and returns an Array with the same number 
of elements, and each element has the running total from the original Array.

Examples:
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []
=end

def running_total(array)
  counter = 1
  while counter < array.size
   array[counter] += array[counter - 1 ]
   counter += 1
  end
  array
end

#or

def running_total(array)
  sum = 0
  array.inject([]) do |arr, num |
    sum += num 
    arr << sum
  end
end

#solution

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

#nice method from student submission:

def running_total(arr)
  arr.map.with_index do |_, i|
    arr[0..i].reduce(&:+)
  end
end