# # Write a method that takes two Array arguments in which each Array contains a list of numbers, 
# and returns a new Array that contains the product of each pair of numbers from the arguments that have the 
# same index. You may assume that the arguments contain the same number of elements.

# # Examples:

# # multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

def multiply_list(arr1, arr2)
  arr1.map.with_index {|num, i|  num * arr2[i]}
end

#Further exploration solutions
def multiply_list(arr1, arr2)
  arr1.zip(arr2).map {|arr|  arr[0] * arr[1]}
end

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map {|arr|  arr.inject(:*)}
end

# LS solution to standard problem
def multiply_list(list_1, list_2)
  products = []
  list_1.each_with_index do |item, index|
    products << item * list_2[index]
  end
  products
end