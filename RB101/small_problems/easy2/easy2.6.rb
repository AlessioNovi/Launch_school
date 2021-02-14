#Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

(1..99).each do |n|
  puts n if n.odd?
end

#solution
value = 1
while value <= 99
  puts value
  value += 2
end