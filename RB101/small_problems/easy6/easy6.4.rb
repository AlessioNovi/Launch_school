
def reverse!(arr)
  counter = 0
  backwards = -1
  while counter < arr.size / 2
    left = arr[counter]
    right = arr[backwards]
    arr[counter] = right
    arr[backwards] = left
    counter += 1
    backwards -= 1
  end
  arr
end

#solution

def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end