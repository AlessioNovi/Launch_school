#Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).

#For this practice problem, write a one-line program that creates the following 
#output 10 times, with the subsequent line indented 1 space to the right:

10.times.each do |line|
  puts (" " * line) + "The Flintstones Rock!"
end

#solution with {} block format
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }