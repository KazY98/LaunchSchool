# Q1 

# an error will occur because greeting was never initialized 
# a local variable initialized within an if statement will be init to nil when the if caluse 
# doesnt get executed 


# Q2

# { a: 'hi there' }   greetings[:a] is ref to the original obj and << is mutating


# Q3

# A) 
# one is one
# two is two
# three is three
# B)
# re-assignment non mutating
# one is one
# two is two
# three is three
# C)
# one is two
# two is three
# three is one


# Q4



def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end


def plus(x)
  p x.object_id
  x = x + 3
  p x.object_id
end
a = 3
p a.object_id
plus(a)

