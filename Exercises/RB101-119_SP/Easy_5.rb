=begin
  
# 1:  

def ascii_value(str)
  tot = 0
  str.each_char do |char|
    tot += char.ord
  end
  tot
end


# 2:

def time_of_day(num)
  total_day = 1440
  while num < 0
    num += total_day
  end
  num = num - (num / total_day) * total_day

  hour = (num / 60).to_s
  min = (num % 60).to_s

  hour.prepend("0") if hour.length == 1
  min.prepend("0") if min.length == 1
 
  hour.concat(":", min)
end


# 3:

def after_midnight(time)
  hour = time[0, 2].to_i
  min = time[3, 2].to_i
  total_min = hour * 60 + min
  total_min -= 1440 if total_min >= 1440
  total_min
end

def before_midnight(time)
  hour = time[0, 2].to_i
  min = time[3, 2].to_i
  total_min = 1440 - (hour * 60 + min)
  total_min -= 1440 if total_min >= 1440
  total_min
end


# 4:

def swap(str)
  swap_arr = str.split.map! do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end
  swap_arr.join(" ")
end


# 5:

def cleanup(str)
  str.gsub(/[^a-zA-Z]/, " ").squeeze(' ')
end


# 6:
# str => hsh
# arr of wrds
# length of wrds : key
# how many wrds of length : val
def word_sizes(str)
  hsh = {}
  str.split.each do |word|
    if hsh.has_key?(word.length)
      hsh[word.length] += 1
    else
      hsh[word.length] = 1
    end
  end
  hsh
end


# 7:

def word_sizes(str)
  hsh = Hash.new(0)
  new_str = str.gsub(/[^a-zA-Z\s]/, '')
  new_str.split.each do |word|
    hsh[word.length] += 1
  end
  hsh
end


# 8:
eng_wrd = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight',
'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen',
'sixteen', 'seventeen', 'eighteen', 'nineteen']
ALPH_HASH = (0..19).zip(eng_wrd).to_h

def alphabetic_number_sort(arr)
  arr.sort do |a, b|
    ALPH_HASH[a] <=> ALPH_HASH[b]
  end
end


# 9:

def crunch(str)
  new_str = ''
  str.length.times do |i|
    new_str << str[i] if str[i] != str[i + 1]
  end
  new_str
end


# 10:

# no. The object is different because the split method was used which creates an 
# array. This array has no connection to the original string.


# 11:

def digit_list(num)
  num.to_s.chars.map(&:to_i)
end

=end
