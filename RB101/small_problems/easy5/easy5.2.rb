=begin

The time of day can be represented as the number of minutes before or after midnight. 
If the number of minutes is positive, the time is after midnight. If the number of minutes is 
negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 
24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

Examples:
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
=end

#this was very tricky. couldn't figure it out witohut peaking at solution...

MINUTES_A_DAY = 1440
MINUTES_AN_HOUR = 60

def time_of_day(minutes)
  time_delta = minutes % MINUTES_A_DAY
  hours, minutes = time_delta.divmod(MINUTES_AN_HOUR)
  "#{sprintf("%02d", hours)}:#{sprintf("%02d", minutes)}"
end

#solution

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end


