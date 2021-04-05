def reverse(array)
  rev_arr = []
  counter = 0
  backwards = -1
  while rev_arr.size < array.size 
    left = array[counter]
    right = array[backwards]
    rev_arr[counter] = right
    rev_arr[backwards] = left
    counter += 1
    backwards -=1
  end
  rev_arr
end

#or

def reverse(array)
  counter = -1
  array.each_with_object([]) do |_, arr|
    arr << array[counter]
    counter -= 1
  end
end