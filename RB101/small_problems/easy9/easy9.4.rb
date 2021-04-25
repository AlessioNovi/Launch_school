# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater than 0.

# Examples:

# sequence(5) == [1, 2, 3, 4, 5]
# sequence(3) == [1, 2, 3]
# sequence(1) == [1]

def sequence(num)
  1.upto(num).map {|num| num}
end

#solution
def sequence(number)
  (1..number).to_a
end

#further exploration by modifying solution
def sequence(number)
  number < 0 ? (number..1).to_a : (1..number).to_a
end


