#Question 1

for i in 0..9 do puts " " * i + "The Flintstones Rock!" end

0.upto(9) { |it| puts " " * it + "The Flintstones Rock!" }


# Question 2

# you're adding two objects with different data types. string and int
puts "the value of 40 + 2 is #{(40 + 2)}"
puts "the value of 40 + 2 is " + (40 + 2).to_s


# Question 3

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end 
  factors
end

# to check if the remainder is 0. the quotient is a whole number.
# to make the factors method return the factors array.


# Question 4

# + because << mutates buffer


# Question 5

# The method is trying to access a variable not defined within it/ outside of its scope.
# Define a method parameter that takes in the limit or define the limit within the method.


# Question 6

# += is re-assignment which is non mutating. the answer is 34.


# Question 7

# + and += are re-assignment which is non mutating.
# but this is not re-assignment because it calls a hash method that is mutating.
# the obj id for the hash remains the same the obj ids for the variables change.
# The hash mutates the variable do not.


# Question 8

# paper


# Question 9

# foo takes no arg so it returns yes. in bar param = "yes" therefore no is returned