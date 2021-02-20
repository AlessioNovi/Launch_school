=begin
Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes 
the square of its argument (the square is the result of multiplying a number by itself).

Example:
square(5) == 25
square(-8) == 64
=end

def multiply(num1, num2)
   num1 * num2
end

def square(num)
  multiply(num, num)
end

#solution from student that i liked

# Old multiply method
def multiply(n1, n2)
  n1 * n2
end

# New power_of_n using the multiply method and recursion
def power_of_n(n, power)
  result = 0
  if power == 1
    return n
  else 
    result =  multiply(n,  power_of_n(n, power - 1))
  end
  result
end

power_of_n(5, 4)