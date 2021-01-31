#In this hash of people and their age,
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
#See if "Spot" is present.

#Bonus: What are two other hash methods that would work just as well for this solution?

ages.include?("Spot")
ages.has_key?("Spot")
ages.member?("Spot")

#solution method:
ages.key?("Spot")

#Starting with this string:

munsters_description = "The Munsters are creepy in a good way."

#Convert the string in the following ways (code will be executed on original munsters_description above):

#"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
#"The munsters are creepy in a good way."
#"the munsters are creepy in a good way."
#"THE MUNSTERS ARE CREEPY IN A GOOD WAY."

munsters_description.swapcase!
munsters_description.capitalize!
munsters_description.downcase!
munsters_description.upcase!


#We have most of the Munster family in our age hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
#add ages for Marilyn and Spot to the existing hash
ages.merge!(additional_ages)

#See if the name "Dino" appears in the string below:
advice = "Few things in life are as important as house training your pet dinosaur."
advice.include?("Dino")
#solution method:
advice.match?("Dino")

#Show an easier way to write this array:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#How can we add the family pet "Dino" to our usual array:
flintstones << "Dino"

#In the previous practice problem we added Dino to our array like this:
#flintstones << "Dino"
#We could have used either Array#concat or Array#push to add Dino to the family.
#How can we add multiple items to our array? (Dino and Hoppy)

flintstones.insert(-1,"Dino", "Hoppy") #bonus
flintstones.push("Dino").push("Hoppy") 
flintstones.concat(%w(Dino Hoppy)) 

#Shorten this sentence:
advice = "Few things in life are as important as house training your pet dinosaur."
#...remove everything starting from "house".

#Review the String#slice! documentation, and use that method to make the return value 
#"Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

#As a bonus, what happens if you use the String#slice method instead?
advice[0,38] #String#slice will return a substring of the array specified by the argument(s) given
advice # here String object has not been mutated 
advice.slice!(0..38) #will return a substring as String#slice and mutating the caller
advice # "as house training your pet dinosaur."

#method solution:
advice.slice!(0, advice.index('house'))

#Write a one-liner to count the number of lower-case 't' characters in the following string:
statement = "The Flintstones Rock!"
statement.count('t')

#Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a 40 character wide table of Flintstone family members, 
#how could we easily center that title above the table with spaces?
title = "Flintstone Family Members"
title.center(40)



