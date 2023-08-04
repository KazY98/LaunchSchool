=begin

# 1:  

user_array = []

def solicit_print(str)
  puts "==> Enter the #{str} number"
end

def update_array(arr)
  user_num = gets.chomp.to_i
  arr << user_num
end

solicit_print("1st")
update_array(user_array)
solicit_print("2nd")
update_array(user_array)
solicit_print("3rd")
update_array(user_array)
solicit_print("4th")
update_array(user_array)
solicit_print("5th")
update_array(user_array)
solicit_print("last")
update_array(user_array)

last_num = user_array.pop
if user_array.include?(last_num)
  puts "The number #{last_num} appears in #{user_array}."
else
  puts "The number #{last_num} does not appear in #{user_array}."
end


# 2:

def pretty_print(str)
  puts "==> #{str}"
end

pretty_print("Enter the first number:")
first_num = gets.chomp.to_i
pretty_print("Enter the second number:")
second_num = gets.chomp.to_i

pretty_print("#{first_num} + #{second_num} = #{first_num + second_num}")
pretty_print("#{first_num} - #{second_num} = #{first_num - second_num}")
pretty_print("#{first_num} * #{second_num} = #{first_num * second_num}")
pretty_print("#{first_num} / #{second_num} = #{first_num / second_num}")
pretty_print("#{first_num} % #{second_num} = #{first_num % second_num}")
pretty_print("#{first_num} ** #{second_num} = #{first_num ** second_num}")


# 3:

puts "Please write word or multiple words:" 
sentence = gets.chomp

count = 0
sentence.each_char do |char|
  count += 1 if char != " "
end
puts "There are #{count} characters in \"#{sentence}\""."


# 4:

def multiply(num1, num2)
  num1 * num2
end


# 5:

def multiply(num1, num2)
  num1 * num2
end

def square(num1)
  multiply(num1, num1)
end


# 6:

def xor?(val1,val2)
  (val1 != val2) ? true : false
end


# 7:

def palindrome?(str)
  (str == str.reverse) ? true : false
end


# 8:

def palindrome?(str)
  (str == str.reverse) ? true : false
end

def real_palindrome?(str)
  str_uni = str.downcase.delete('^a-z0-9')
  palindrome?(str_uni)
end


# 9:

def palindrome?(str)
  (str == str.reverse) ? true : false
end

def palindromic_number?(num)
  palindrome?(num.to_s)
end


# 10:

def uppercase?(str)
  return nil if str.to_s != str 
  str.upcase == str
end

=end