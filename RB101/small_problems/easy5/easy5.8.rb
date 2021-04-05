=begin
Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers 
sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, 
fifteen, sixteen, seventeen, eighteen, nineteen

Examples:
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
=end

PAIRS = {'zero' => 0 , 'one' => 1, 'two' => 2, 
'three' => 3, 'four' => 4, 
'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 
'nine' => 9 , 
'ten' => 10, 'eleven' => 11, 'twelve' => 12, 
'thirteen' => 13, 'fourteen' => 14, 
'fifteen' => 15, 'sixteen' => 16, 'seventeen' => 17, 
'eighteen' => 18, 'nineteen' => 19}

def alphabetic_number_sort(array)
  PAIRS.sort.inject([]) { |arr, pair| arr << pair[1] }
end

#solution

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end
   
  

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]