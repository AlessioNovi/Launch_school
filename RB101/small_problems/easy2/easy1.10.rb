#What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# Moe Larry CURLY SHEMP Harpo CHICO Groucho Zeppo
#line 5 call each method on array1 which will iterate over the array and 
#push each object into empty array2. Both arrays will reference to the same objects at this point.
#line 6 will iterate again array1 and will mutate by upcasing the elements inside the array
#if they meet they condition inside the block. As both array share the objects,
#the same modification will apply on array2

#solution comment

#Wait a minute! We changed Curly to CURLY, Shemp to SHEMP, and Chico to CHICO in array1. How'd those changes end up in array2 as well?

#The answer lies in the fact that the first each loop simply copies a bunch of references
#from array1 to array2. When that first loop completes, both arrays not only contain the same values, 
#they contain the same String objects. If you modify one of those Strings, that modification will show up in both Arrays.

#If this answer surprises you, reread the section on Pass by Reference vs Pass by 
# in Lesson 2 of Programming Foundations. To be successful with ruby, you must 
#understand how values are passed around, and what mutation means for those values.
