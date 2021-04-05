def remove_vowels(array)
  array.map { |el| el.delete('aeiouAEIOU') }
end

