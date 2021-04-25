def find_dup(array)
  array.each {|num| return num if array.count(num) == 2}
end

#solution

def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end