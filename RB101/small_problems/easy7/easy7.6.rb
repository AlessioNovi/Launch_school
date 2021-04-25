# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase 
# or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when 
# toggling the desired case.

# Example:

# staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# staggered_case('ALL CAPS') == 'AlL cApS'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

#reused LS solution to solve excercise
def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper if (('a'..'z').to_a + ('A'..'Z').to_a).include?(char)
  end
  result
end

#used my own previous solution just to prove it works the same
def staggered_case(string)
  counter = 0
  string.chars.each do |letter|
    if counter.odd?
      letter.downcase!
    else
      letter.upcase!
    end
    counter +=1 if (('a'..'z').to_a + ('A'..'Z').to_a).include?(letter)
  end.join
end

#Further exploration
def staggered_case(string, count_alpha = true)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    if count_alpha
      need_upper = !need_upper
    else
    need_upper = !need_upper if (('a'..'z').to_a + ('A'..'Z').to_a).include?(char)
    end
  end
  result
end

#solution to standard problem
def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if char =~ /[a-z]/i
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    else
      result += char
    end
  end
  result
end

