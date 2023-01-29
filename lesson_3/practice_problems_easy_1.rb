# Question 1

numbers = [1, 2, 2, 3]
numbers.uniq # method that returns an array that contains the unique values found in the 
# original array

puts numbers # prints  1 2 2 3 uniq does not mutate the array. and puts prints the elements
# of the array


# Question 2

# ! is a not operator if it precedes an object . it evaluates if the expression is true 
# or false then flips it If it comes after a method it means the method is mutating the object
# its acting on. ? checks if things are true if preceding and after returns a boolean value.
# depending of the method.
# 1 != is not equal to. can be used in 
# 2 evaluates if the expression is true or false then flips it
# 3 method is mutating
# 4 ? if preceding an object checks if its true
# 5 ? after an object returns a boolean depending on the method
# 6 !! is not(not(object)) equivalent to is object true or false


# Question 3

advice = "Few things in life are as important as house training your pet dinosaur."
array_of_words = advice.split
array_of_words.map!{ |word| word == 'important' ? 'urgent' : word } 
p array_of_words.join(' ')

p advice.gsub!('important', 'urgent')


# Question 4

numbers = [1, 2, 3, 4, 5]
p numbers.delete_at(1) # deletes at the index of 1 in the array
numbers = [1, 2, 3, 4, 5]
p numbers.delete(1) # deletes all instances of 1 in the array


# Queation 5

p (10..100).include?(42) # does the range of 10 to 100 include 42  cover? works


# Question 6

famous_words = "seven years ago..."
# + and prepend
words = "Four score and "
puts words + famous_words
puts famous_words.prepend(words)


# Question 7

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

p flintstones.flatten! # turns nested array into un-nested


# Question 8

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p flintstones.assoc("Barney")



