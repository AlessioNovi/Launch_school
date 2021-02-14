#Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

#Note: 1 square meter == 10.7639 square feet

#Do not worry about validating the input at this time.

#Example Run
#Enter the length of the room in meters:
#10
#Enter the width of the room in meters:
#7
#The area of the room is 70.0 square meters (753.47 square feet).

puts "Enter the length of the room in meters:"
length = gets.chomp.to_f
puts "Enter the width of the room in meters:"
width = gets.chomp.to_f
puts "The area of the room is #{(length * width)} square meters (#{((length * width) * 10.7639).round(2)} square feet)."


#solution:
SQMETERS_TO_SQFEET = 10.7639

puts '==> Enter the length of the room in meters: '
length = gets.to_f

puts '==> Enter the width of the room in meters: '
width = gets.to_f

square_meters = (length * width).round(2)
square_feet = (square_meters * SQMETERS_TO_SQFEET).round(2)

puts "The area of the room is #{square_meters} " + \
     "square meters (#{square_feet} square feet)."