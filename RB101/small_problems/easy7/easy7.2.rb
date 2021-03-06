# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that 
# are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

# Examples

# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }


def letter_case_count(string)
  hash = {lowercase: 0, uppercase: 0, neither: 0}
  string.split('').each do |word|
    if ('a'..'z').to_a.include?(word)
      hash[:lowercase] += 1
    elsif ('A'..'Z').to_a.include?(word)
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
  end
  hash
end

#solutions

UPPERCASE_CHARS = ('A'..'Z').to_a
LOWERCASE_CHARS = ('a'..'z').to_a

def letter_case_count(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }

  string.chars.each do |char|
    if UPPERCASE_CHARS.include?(char)
      counts[:uppercase] += 1
    elsif LOWERCASE_CHARS.include?(char)
      counts[:lowercase] += 1
    else
      counts[:neither] += 1
    end
  end

  counts
end

def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end