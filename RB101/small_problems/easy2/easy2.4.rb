#Build a program that displays when the user will retire and how many years she has to work till retirement.

#Example:
#What is your age? 30
#At what age would you like to retire? 70

#It's 2016. You will retire in 2056.
#You have only 40 years of work to go!

puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i

current_year = Time.now.year
time_to_work = retire_age - age
retirement_year = current_year + time_to_work

puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You have only #{time_to_work} years of work to do!"

#solution is the same