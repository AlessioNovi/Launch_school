=begin
Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

Examples:
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'
=end

def century(num)
  century = (num.to_f / 100).ceil
  string_century = transform_century(century)
  string_century
end

def transform_century(century)
  if %w(11 12 13).include?(century.to_s[-2..-1])
    return century = century.to_s + "th"
  end
  case century.to_s[-1]
  when '1'
    century.to_s + "st"
  when '2'
    century.to_s + "nd"
  when '3'
    century.to_s + "rd"
  else
    century.to_s + "th"
  end
end

#solution

def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end
