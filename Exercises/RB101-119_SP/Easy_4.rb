=begin
# 1:
def short_long_short(str1, str2)
  if str1.size > str2.size
    str2 + str1 + str2
  else
    str1 + str2 + str1
  end
end


# 2:

def century(year)
  ends = ['st', 'nd', 'rd', 'th']
  year_arr = year.divmod(100)
  if year_arr[1] != 0
    year_arr[0] += 1
  end
  cntry = year_arr[0].to_s
  if cntry.end_with?('11', '12', '13')
    cntry << 'th'
  elsif cntry.end_with?('1')
    cntry << 'st'
  elsif cntry.end_with?('2')
    cntry << 'nd'
  elsif cntry.end_with?('3')
    cntry << 'rd'  
  else
    cntry << 'th'
  end
end


# 3:

def leap_year?(year)
  year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
end


# 4:

def leap_year?(year)
  if year >= 1752
    year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
  else
    year % 4 == 0
  end
end


# 5:

def multisum(num)
  ans = []
  1.upto(num) do |inc|
    ans << inc if (inc % 3 == 0 || inc % 5 == 0)
  end
  ans.sum
end


# 6:

def running_total(arr)
  sum = 0
  arr.map { |num| sum += num }
end


# 7:

def string_to_integer(str)
  digits = {
    '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
    '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
  }
  inc = 0
  sum = 0
  str.reverse.each_char do |char|
    sum += digits[char] * 10**inc
    inc += 1
  end
  sum
end


# 8:

def string_to_signed_integer(str)
  case str[0]
  when '-' then -string_to_integer(str[1..-1])
  when '+' then string_to_integer(str[1..-1])
  else string_to_integer(str)
  end
end


# 9:

def integer_to_string(num)
  str_hash = (0..9).zip('0'..'9').to_h
  num_arr = num.digits.reverse

  num_arr.each_with_object('') do |el, obj|
    obj << str_hash[el]
  end
end


# 10:

def signed_integer_to_string(num)
  case num <=> 0
  when -1 then '-' << integer_to_string(-num)
  when 1 then '+' << integer_to_string(num)
  else '0'
  end
end
