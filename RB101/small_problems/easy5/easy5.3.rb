=begin

Write two methods that each take a time of day in 24 hour format, 
and return the number of minutes before and after midnight, respectively. 
Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

Examples:
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0
=end

HOURS_PER_DAY = 24
MINUTES_AN_HOUR = 60
MINUTES_A_DAY = 1440

def after_midnight(time_string)
  hours = time_string[0..1].to_i 
  minutes = time_string[3..4].to_i
  (hours % HOURS_PER_DAY) * MINUTES_AN_HOUR + minutes
end

def before_midnight(time_string)
  result = MINUTES_A_DAY - after_midnight(time_string)
  result = 0 if result == MINUTES_A_DAY
  result
end

#solution

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end