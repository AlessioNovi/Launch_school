#Create a simple tip calculator. 
#The program should prompt for a bill amount and a tip rate. 
#The program must compute the tip and then display both the tip and the total amount of the bill.

#Example:
#What is the bill? 200
#What is the tip percentage? 15

#The tip is $30.0
#The total is $230.0

#includes further exploration
puts "What is the bill?"
bill = gets.chomp.to_f
puts "What is the tip percentage?"
percentage = gets.chomp.to_f
tip = ((bill * percentage) / 100).round(2)
total = (bill + tip).round(2)

puts "The tip is $#{sprintf("%.2f",tip)}"
puts "The total is $#{sprintf("%.2f",total)}"

#solution
print 'What is the bill? '
bill = gets.chomp
bill = bill.to_f

print 'What is the tip percentage? '
percentage = gets.chomp
percentage = percentage.to_f

tip   = (bill * (percentage / 100)).round(2)
total = (bill + tip).round(2)

puts "The tip is $#{tip}"
puts "The total is $#{total}"
