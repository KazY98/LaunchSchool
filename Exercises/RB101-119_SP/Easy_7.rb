=begin

# 1:  

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end


# 2:

def letter_case_count(str)
  return_hash = {lowercase: 0, uppercase: 0, neither: 0}
  str.each_char do |char|
    if char.upcase == char && char.downcase == char
      return_hash[:neither] += 1
    elsif char.upcase == char
      return_hash[:uppercase] += 1
    else 
      return_hash[:lowercase] += 1
    end
  end
  return_hash
end


# 3:

def word_cap(str)
  (str.split.map { |wrd| wrd.capitalize }).join(' ')
end


# 4:
def swapcase(str)
  ret_arr = str.chars.map do |ltr|
          if ltr.upcase == ltr
            ltr.downcase
          else
            ltr.upcase
          end
        end
  ret_arr.join('')
end


# 5:

def staggered_case(str)
  lower_str = str.downcase
  ret_str = ''
  lower_str.chars.each_with_index do |ltr, ind|
    (ind.even?)? ret_str << ltr.upcase : ret_str << ltr
  end
  ret_str
end


# 6:

def staggered_case(str)
  lower_str = str.downcase
  up = true
  ret_str = ''
  lower_str.chars.each do |ltr|
    if ltr =~ /[a-z]/
      if up
        ret_str += ltr.upcase
        up = !up
      else
        ret_str += ltr
        up = !up
      end
    else
      ret_str += ltr
    end
  end
  ret_str
end


# 7:

def show_multiplicative_average(arr)
  product = arr.reduce(1, :*).to_f
  num_el = arr.length
  avg = product/num_el
  format('%.3f', avg)
end


# 8:

def multiply_list(arr1, arr2)
  ret_arr = []
  arr1.length.times do |iter|
    ret_arr << arr1[iter] * arr2[iter]
  end
  ret_arr
end

# or

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map{ |a, b| a * b }
end


# 9:

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |a, b| a * b }.sort
end


# 10:

def penultimate(str)
  str.split[-2]
end


def penultimate(str) # returns nil if str has less than 2 words
  str.split.size >= 2 ? str.split[-2] : nil
end



def penultimate(str) # returns middle word(s)
  # if even number of words returns 2 words
  # if less than 2 words return nil
  arr = str.split
  cut = arr.size / 2
  if arr.size >= 2 
    str.size.odd? ? [arr[cut-1], arr[cut]].join(' ') : arr[cut]
  end
end


# 11:

def count_occurrences(arr)
  print_hash = Hash.new(0)
  arr.each do |el|
    print_hash[el.downcase] += 1
  end
  print_hash.each { |key, val| puts "#{key} => #{val}" }
end

=end
