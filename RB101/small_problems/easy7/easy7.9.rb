# Write a method that takes two Array arguments in which each Array contains a list of numbers, 
# and returns a new Array that contains the product of every pair of numbers that can be formed between 
# the elements of the two Arrays. The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

# Examples:

# multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

def multiply_all_pairs(arr1, arr2)
  result = []
  arr1_i = 0
  loop do
    arr2_i = 0
    loop do 
      result << arr1[arr1_i] * arr2[arr2_i]
      arr2_i += 1
      break if arr2_i == arr2.size
    end
    arr1_i += 1
    break if arr1_i == arr1.size
  end
  result.sort
end

#LS solutions
def multiply_all_pairs(array_1, array_2)
  products = []
  array_1.each do |item_1|
    array_2.each do |item_2|
      products << item_1 * item_2
    end
  end
  products.sort
end

def multiply_all_pairs(array_1, array_2)
  array_1.product(array_2).map { |num1, num2| num1 * num2 }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) 