=begin
    
# 1:

puts "What is your name?"
name = gets.chomp

if name == ""
  name = "Teddy"
end

age = rand(20..200)
puts "#{name} is #{age} years old!"


# 2:

puts "Enter the length of the room in meters:"
length = gets.chomp.to_i
puts "Enter the width of the room in meters:"
width = gets.chomp.to_i

area_meters = length * width
area_feet = length * width * 10.7639

puts "The area of the room is #{area_meters} square meters (#{area_feet} square feet)."


# 3:

puts "What is the bill?"
bill = gets.chomp.to_i
puts "What is the tip percentage?"
percent = gets.chomp.to_i

tip = bill * percent / 100.0
total = bill + tip

puts "The tip is $#{tip}"
puts "The total is $#{total}"


# 4:

puts "What is your age?" 
age = gets.chomp.to_i
puts "At what age would you like to retire?" 
retire_age = gets.chomp.to_i

work_years = retire_age - age
current_year = Time.now.year
retire_year = current_year + work_years

puts "It's #{current_year}. You will retire in #{retire_year}."
puts "You have only #{work_years} years of work to go!"


# 5:

puts "What is your name?"
name = gets.chomp

if name.end_with?("!")
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end


# 6:

100.times do |num|
  if num % 2 != 0
    puts num
  end
end 


# 7:

num = 1
while num < 50
  puts num * 2
  num += 1
end


# 8:

puts "Please enter an integer greater than 0:"
int = gets.chomp.to_i
puts "Enter 's' to compute the sum, 'p' to compute the product."
s_p = gets.chomp

ans = 0
ans_p = 1

if s_p == 's'
  1.upto(int) do |num|
    ans += num
  end
elsif s_p == 'p'
  1.upto(int) do |num|
    ans_p *= num
    ans = ans_p
  end
end
puts "The sum of the integers between 1 and #{int} is #{ans}."


# 9:

'BOB'
'BOB'
# the string object that was being referenced by both variables was mutated


# 10:

def negative(number)
  (number > 0) ? -number : number 
end


=end