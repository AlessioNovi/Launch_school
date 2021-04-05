
def find_fibonacci_index_by_length(n)
  arr = [1,1]
  loop do
    fibonacci = arr[-1] + arr[-2]
    arr << fibonacci
    break if arr[-1].digits.size == n
  end
  arr.size
end

#solution

def find_fibonacci_index_by_length(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_digits

    first = second
    second = fibonacci
  end

  index
end
