
DEGREE = "\xC2\xB0"

def dms(num)
 degree, degree_rem = num.divmod(1)
 minutes, minutes_rem = (degree_rem * 60).divmod(1)
 seconds = (minutes_rem * 60).to_i
 display_min = sprintf(%(%02d'), minutes)
 display_sec = sprintf(%(%02d"), seconds) 
 "#{degree}#{DEGREE}#{display_min}#{display_sec}"
end


#solution

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end
