=begin

# 1:

def repeat(str, int)
  int.times do 
    puts str
  end
end
repeat('Hello', 3)


# 2:

def is_odd?(num)
  num % 2 != 0  
end


# 3: 

def stringy(num)
  pattern_num = num / 2
  base_pattern = '10' * pattern_num
  if num % 2 != 0
    return base_pattern + '1'
  end
  base_pattern
end


# 4:

def calculate_bonus(salary, bonus)
  bonus ? (salary / 2) : 0
end


# 5:

def print_in_box(text)
  length = text.length
  top_bot_box = "+-" + "-" * length + "-+"
  second_fourth_line = "| " + " " * length + " |"
  text_line = "| " + text + " |"
  puts top_bot_box 
  puts second_fourth_line
  puts text_line
  puts second_fourth_line
  puts top_bot_box
end


# 6:

def triangle(n)
  (n + 1).times do |num|
    puts " " * (n - num) + "*" * num
  end
end


# 7:

puts "Enter a noun:"
noun = gets.chomp 
puts "Enter a verb:"
verb = gets.chomp
puts "Enter an adjective:"
adjective = gets.chomp
puts "Enter an adverb:"
adverb = gets.chomp
puts ""
puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"


# 8:

def reversed_number(num)
  str_num = num.to_s
  str_num.reverse.to_i 
end


# 9:
# str => str length 1 or 2
# length?  odd or even?
# cut str/2 at index or str/2 -1 and str/2
def center_of(text)
  length = text.size
  cut = length / 2
  (length % 2 == 0) ? text[cut - 1, 2] : text[cut]
end

=end