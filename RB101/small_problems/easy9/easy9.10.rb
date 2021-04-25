# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

# Example:

# buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]

def buy_fruit(array)
  array.map do |sub_arr| 
    sub_arr[1].times.map {|_| sub_arr[0]}
  end.flatten
end

#Solution 1
def buy_fruit(list)
  expanded_list = []

  list.each do |item|
    fruit, quantity = item[0], item[1]
    quantity.times { expanded_list << fruit }
  end

  expanded_list
end

#Solution 2
def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end