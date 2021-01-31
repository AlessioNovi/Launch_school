#Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).

#For this practice problem, write a one-line program that creates the following 
#output 10 times, with the subsequent line indented 1 space to the right:

10.times.each do |line|
  puts (" " * line) + "The Flintstones Rock!"
end

#solution with {} block format
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

#The result of the following statement will be an error:
puts "the value of 40 + 2 is " + (40 + 2)
#Why is this and what are two possible ways to fix this?

#type error is dispalyed because it's not possible to perform concatenation between a string and an integer
#solution explanation: This will raise an error TypeError: no implicit conversion of Integer into String because 
#(40+2) results in an integer and it is being concatenated to a string.
puts "the value of 40 + 2 is #{(40 + 2)}"
puts "the value of 40 + 2 is " + (40 + 2).to_s
