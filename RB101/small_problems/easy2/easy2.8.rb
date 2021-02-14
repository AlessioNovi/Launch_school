#Write a program that asks the user to enter an integer greater than 0, 
#then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

#Examples:

#>> Please enter an integer greater than 0:
#5
#>> Enter 's' to compute the sum, 'p' to compute the product.
#s
#The sum of the integers between 1 and 5 is 15.


#>> Please enter an integer greater than 0:
#6
#>> Enter 's' to compute the sum, 'p' to compute the product.
#p
#The product of the integers between 1 and 6 is 720.

puts "Please enter an integer greater than 0:"
input = gets.to_i

range = (1..input)

puts "Enter 's' to compute the sum. 'p' to compute the product"
computation = gets.chomp

if computation == 's'
  sum = range.reduce(:+) #revised using "#reduce" as per further exploration suggestion
  puts "The sum of the integers between 1 and #{input} is #{sum}."
elsif computation == 'p'
  product = range.reduce(:*) #revised using "#reduce" as per further exploration suggestion 
  puts "The product of the integers between 1 and #{input} is #{product}."
else
  puts "Wrong computation choice"
end

#solution
def compute_sum(number)
  total = 0
  1.upto(number) { |value| total += value }
  total
end

def compute_product(number)
  total = 1
  1.upto(number) { |value| total *= value }
  total
end

puts ">> Please enter an integer greater than 0"
number = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation == 's'
  sum = compute_sum(number)
  puts "The sum of the integers between 1 and #{number} is #{sum}."
elsif operation == 'p'
  product = compute_product(number)
  puts "The product of the integers between 1 and #{number} is #{product}."
else
  puts "Oops. Unknown operation."
end
    
  
  
