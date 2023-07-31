# PEDAC Intro

# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

=begin

Given: String
return: array of strings

What is a sub-string?
what to do if there are multiple words?
should I treat spaces as separating two words?
should I return the same case?

do not return strings of length 1. at least 2 characters
-------------------------------------
def select_fruit(produce_list)
  iter = 0
  produce_keys = produce_list.keys
  selected_fruits = {}

  loop do
    break if iter == produce_keys.size

    current_key = produce_keys[iter]
    current_value = produce_list[current_key]

    if produce_list[current_key] == "Fruit"
      selected_fruits[current_key] = current_value
    end
    iter += 1
  end
  selected_fruits
end


produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
-------------------


def multiply(numbers, multiplier)
  iter = 0
  ans = []
  loop do
    break if numbers.size == iter

    current_num = numbers[iter]
    ans[iter] = current_num * multiplier
    iter += 1
  end
  ans
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]

----------------------------
Practice Problems
1:

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

[1,2,3]
the last evaluated line 'hi' is truthy so all elements are selected


2:

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

1
count checks the truthiness of the blocks return value, counting how many are true or truthy


3:

[1, 2, 3].reject do |num|
  puts num
end

[1,2,3]
the last evaluated line in the block returns nil which is falsey. reject returns elements that are falsey


4:

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

{'a' => 'ant' , 'b' => 'bear' , 'c' => 'cat'}
each with object returns the object in the argument so in this case a hash obj. the key is the first character of the string and the value
is the elements of the array


5:

hash = { a: 'ant', b: 'bear' }
hash.shift

shift mutates the hash by removing and returning the first key value pair in the hash
[a: , "ant"]


6:

['ant', 'bear', 'caterpillar'].pop.size

11
pop returns the last element of the array and size returns an integer equal to how many characters are in the string


7:

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

the blocks return value is either true or false determined if the integer in the array is odd.
any returns true if the block is ever true it ouputs 1. the program stops after the first
iteration because the block returns true.


8:

arr = [1, 2, 3, 4, 5]
arr.take(2)

take returns an array containing the first number of elements equal to the argument 
[1,2]  no it is not destructive


9:

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

[nil, "bear"]
the return value if all the if statements are false is nil


10:

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

[1, nil, nil]
puts returns nil for numbers greater than 1

-------------------------------------------------------------------------------------------

Additional Practice Problems

1:

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones.each_with_index do |name, ind|
  flintstones_hash[name] = ind
end

p flintstones_hash


2:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.sum


3:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.reject! do |name, age|
  age > 100
end

p ages


4:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.sort.first


5:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

index = 0
flintstones.each_with_index do |name, ind|
  if name.start_with?("Be")
    index = ind
    break
  end
end

p index


6:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map do |name|
  name.slice!(3, name.length)
end

p flintstones


7:

statement = "The Flintstones Rock"

hash_freq = {}
statement.delete(" ").each_char do |letter|
  if hash_freq[letter] == nil
    hash_freq[letter] = 1
  else
    hash_freq[letter] += 1
  end
end

p hash_freq


8:

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# 1 3

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# 1 2


9:

words = "the flintstones rock"

def titleize(sentence)
  words_arr = sentence.split 
  words_arr.map do |word|
    word.capitalize!
  end
  words_arr.join(" ")
end

p titleize(words)


10:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, hash|
  if hash["age"] <= 17
    hash["age_group"] = "kid"
  elsif hash["age"] <= 64
    hash["age_group"] = "adult"
  else
    hash["age_group"] = "senior"
  end
end 

p munsters

------------------------------------------------------------------------------------
=end
















