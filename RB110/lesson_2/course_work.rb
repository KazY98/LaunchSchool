=begin
# Practice Problems: Sorting, Nested Collections and Working with Blocks

# 1:

arr = ['10', '11', '9', '7', '8']
# array of strings to int 
# sort decending 

arr.sort do |x, y| 
  y.to_i <=> x.to_i
end


# 2:

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort do |x, y|
  x[:published].to_i <=> y[:published].to_i
end

books.sort_by do |book|
  book[:published]
end


# 3

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
p arr1[2][1][3]
arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
p arr2[1][:third][0]
arr3 = [['abc'], ['def'], {third: ['ghi']}]
p arr3[2][:third][0][0]
hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p hsh1['b'][1]
hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p hsh2[:third].keys[0]


# 4:

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4
hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4 


# 5:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0
munsters.values.each do |hsh| # can use .each_value instead
  if hsh["gender"] == "male"
    total_age += hsh["age"] 
  end
end
total_age


# 6:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, hsh|
  age = hsh["age"]
  gender = hsh["gender"]
  puts "#{name} is a #{age}-year-old #{gender}."
end


# 7:

a = "hey"
b = [5, 8]
arr = [a, b]

p a.object_id
p arr[0].object_id

arr[0] << "2"
p arr[0].object_id

# 2
# [3,8]


# 8:

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, arr|
  arr.each do |word|
    word.each_char do |letter|
      puts letter if 'aeiou'.include?(letter)
    end
  end
end


# 9:

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |sub_arr|
  sub_arr.sort do |x, y|
    y <=> x
  end
end


# 10:

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr.map do |hsh|
  ret_hsh = {}
  hsh.each do |key, val|
    ret_hsh[key] = val + 1
  end
  ret_hsh
end


# 11:

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

arr.map do |sub_arr|
  sub_arr.select do |num|
    num % 3 == 0
  end
end


# 12:

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
hsh = {}
arr.each do |element|
  hsh[element[0]] = element[1]
end
hsh


# 13:

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
arr.sort_by do |element|
  element.select do |num|
    num.odd?
  end
end


# 14:

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |_, val|
  if val[:type] == 'fruit'
    val[:colors].map do |color|
      color.capitalize
    end
  elsif val[:type] == 'vegetable'
    val[:size].upcase
  end
end


# 15:

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hsh|
  hsh.values.flatten.all? do |num|
    num % 2 == 0
  end
end


# 16:
# 8-4-4-4-12
def uuid
  ret_str = ""

  32.times do 
    ret_str << rand(0..15).to_s(16)
  end

  dashs = [20,16,12,8]
  dashs.each do |dash|
    ret_str.insert(dash, "-")
  end

  ret_str
end

=end
