=begin

Problem 
Write a program that will ask a user for an input of a word or multiple 
words and give back the number of characters. Spaces should not be counted as a character.

input:
Please write word or multiple words: walk

output:
There are 4 characters in "walk".

input:
Please write word or multiple words: walk, don't run

output:
There are 13 characters in "walk, don't run".

Examples
As per above

Data structure
  String

Algorithm

set variable that asks for string
set variable that is the length of string without spaces

output string value and length of string

Code
code below

=end

puts "Please write word or multiple words:"
input = gets.chomp
input_length = input.split.join.length
puts "There are #{input_length} characters in #{input.inspect}."


#solution
print 'Please write word or multiple words: '
input = gets.chomp
number_of_characters = input.delete(' ').size
puts "There are #{number_of_characters} characters in \"#{input}\"."

