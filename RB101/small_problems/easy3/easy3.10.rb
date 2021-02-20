=begin
Write a method that returns true if its integer argument is palindromic, 3
false otherwise. A palindromic number reads the same forwards and backwards.

Examples:
palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true
=end

def palindromic_number?(num)
  num.to_s == num.to_s.reverse
end

