def include?(array, arg)
  array.each {|el| return true if el == arg}
  false
end

#solution

#the easy way

def include?(array, value)
  !!array.find_index(value)
end

#A slightly harder way

Copy Code
def include?(array, value)
  array.each { |element| return true if value == element }
  false
end