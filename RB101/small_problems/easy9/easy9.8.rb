# Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number 
# of a sequence that your method will create. The method should return an Array that contains the same number of elements 
# as the count argument, while the values of each element will be multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. 
# If the count is 0, an empty list should be returned.

# Examples:

# sequence(5, 1) == [1, 2, 3, 4, 5]
# sequence(4, -7) == [-7, -14, -21, -28]
# sequence(3, 0) == [0, 0, 0]
# sequence(0, 1000000) == []

def sequence(count, first_num)
  count.times.map {|n| first_num * (n+1)}
end

#Solution 1
def sequence(count, first)
  sequence = []
  number = first

  count.times do
    sequence << number
    number += first
  end

  sequence
end

#Solution 2
def sequence(count, first)
  (1..count).map { |value| value * first }
end
