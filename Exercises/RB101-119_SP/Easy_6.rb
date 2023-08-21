=begin

# 1:

DEGREE = "\xC2\xB0"
def dms(flt)
  deg = flt.floor(0)

  deg_remainder = flt - deg
  min = (deg_remainder * 60).floor(0)

  min_remainder = deg_remainder * 60 - min 
  sec = (min_remainder * 60).floor(0)
  deg = deg.to_s
  min = min.to_s
  sec = sec.to_s
  min.prepend('0') if min.length == 1
  sec.prepend('0') if sec.length == 1

  deg.concat(DEGREE, min, '\'', sec, '"')
end


# 2:

def remove_vowels(arr_str)
  arr_str.map do |str|
    str.gsub(/[aeiouAEIUO]/, '')
  end
end


# 3:

def find_fibonacci_index_by_length(int) # int > 1
  iter = 2
  fib = [1, 1]
  loop do
    fib << fib[iter - 1] + fib[iter - 2]
    break if fib[iter].to_s.length >= int
    iter += 1
  end
  iter + 1
end


# 4:
def reverse!(arr)
  num_of_iters = arr.length / 2
  num_of_iters.times do |iter|
    arr[iter], arr[-iter - 1] = arr[-iter - 1], arr[iter]
  end
  arr
end


# 5:

def reverse(arr)
  arr.each_with_object([]) { |num, obj| obj.prepend(num) }
end



# 6:

def merge(arr1, arr2)
  combined_arr = []
  arr1.each { |num| combined_arr << num if !combined_arr.include?(num) }
  arr2.each { |num| combined_arr << num if !combined_arr.include?(num) }
  combined_arr
end

def merge(arr1, arr2)
  arr1 | arr2
end


# 7:

def halvsies(arr)
  cut = (arr.length / 2) - 1 if arr.length % 2 == 0
  cut = arr.length / 2 if arr.length % 2 != 0
  [arr[0..cut],arr[(cut + 1)..-1]]
end


# 8:

def find_dup(arr)
  arr.each do |num|
    return num if arr.count(num) > 1
  end
end


# 9:

def include?(arr, srch)
  arr.any?(srch)  
end


# 10:

# array2 would be affected by upcase! because the str objects in
# array2 reference the same objects as array1

=end
