def interleave(arr1, arr2)
  new_array = []
  counter = 0 
  loop do
    break if new_array.size == (arr1+arr2).size
    new_array << arr1[counter]
    new_array << arr2[counter]
    counter +=1
  end
  new_array
end

#further exploration
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

#solution 

def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end




