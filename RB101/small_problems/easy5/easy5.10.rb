=begin 
Write a method that will take a short line of text, and print it within a box.

Example:

print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+
=end

def print_in_box(string) #with truncate 
  string1 = string.length > 76 ? string[0..75] : string
  puts string1.size
  puts "+" + "-" * (string1.length + 2) + "+"
  puts "|" + ' ' * (string1.length + 2) + "|"
  puts "| " + string1 + " |"
  puts "|" + ' ' * (string1.length + 2) + "|"
  puts "+" + "-" * (string1.length + 2) + "+"
end

#wrap and center - a bit ugly but looks like it works...
def angles(string)
  if string.length <= 76
    puts "+" + "-" * (string.length + 2) + "+"
  else
    puts "+" + "-" * (77) + "+"
  end
end

def medium(string)
  if string.length <= 76
    puts "|" + ' ' * (string.length + 2) + "|"
  else
    puts "|" + ' ' * (77) + "|"
  end
end

def wrap_text(string)
  counter = 0
  if string.length >= 76
  while counter < string.size
    if string.slice(counter, 75).size < 75
      return puts "| " + string.slice(counter, 75) + ' ' * (75 - string.slice(counter, 75).size) + " |"
    end
    puts "| " + string.slice(counter, 75) + " |"
    counter += 75
  end
  else
    puts "| " + string.slice(counter, 75) + " |"
  end
end

def print_in_box(string) 
  angles(string)
  medium(string)
  wrap_text(string)
  medium(string)
  angles(string)
end

#solution

def print_in_box(message)
   horizontal_rule = "+#{'-' * (message.size + 2)}+"
   empty_line = "|#{' ' * (message.size + 2)}|"

   puts horizontal_rule
   puts empty_line
   puts "| #{message} |"
   puts empty_line
   puts horizontal_rule
end


