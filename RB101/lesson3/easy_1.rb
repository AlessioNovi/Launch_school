#What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers 
#1
#2
#2
#3, numbers.uniq returns a new array [1, 2, 3]
#without modifying original array


#Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:
# ! ? are generally related to specific method names and broadly are used for
# destructive methods and for searching a specific element in an object

#what is != and where should you use it?
# != means not equal and should be used when comparing elements in a equality expression

# ! before something, like !user_name
# this would transform the target object in a boolean with the opposite value

#put ! after something, like words.uniq!

# ? before something 
# ? : ternary operator

#put ? after something

#put !! before something, like !!user_name.
# !! transform the target object in their respective boolean value

#Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."
advice.sub!("important" , "urgent") 
#gsub! will modify multiple occurences. for our case sub is enough



#The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]
#What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)
#will delete the array element found on index position 1: 2
numbers.delete(1)
#will delete the array element corresponding the argument passed into the method call: 1

#Programmatically determine if 42 lies between 10 and 100.

(10..100).cover?(42)

famous_words = "seven years ago..."
#show two different ways to put the expected "Four score and " in front of it.

famous_words.prepend("Four score and ")
"Four score and " + famous_words

#If we build an array like this:


flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
#We will end up with this "nested" array:


["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
#Make this into an un-nested array.
flintstones.flatten!

#Given the hash below


flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
#Turn this into an array containing only two elements: Barney's name and Barney's number
flintstones = ["Barney" , 2] #works by simply reassigning variable to a new array object

#after watching solution: this will return a new array without mutating the caller
flintstones.assoc("Barney")

