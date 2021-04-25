def triangle(num)
  (num+1).times {|n| puts ("*"*(n)).rjust(num)}
end

#didn't quite undertand the second part of further exploration but done the upside down version here
def triangle(num)
  inv_num = num
  (num+1).times do |n|
  puts ("*"*(inv_num)).rjust(num)
  inv_num -= 1
  end
end

#solution
def triangle(num)
  spaces = num - 1
  stars = 1

  num.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end