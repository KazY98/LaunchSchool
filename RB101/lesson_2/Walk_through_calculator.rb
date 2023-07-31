def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0 || num == '0'
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name:")
name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  first_number = ''
  second_number = ''

  loop do
    prompt("What's the first number?")
    first_number = Kernel.gets().chomp()

    if valid_number?(first_number)
      break
    else
      prompt("Hmmm... that doesn't look like a valid number")
    end
  end

  loop do
    prompt("What's the second number?")
    second_number = Kernel.gets().chomp()

    if valid_number?(second_number)
      break
    else
      prompt("Hmmm... that doesn't look like a valid number")
    end
  end
  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) addition
    2) subtraction
    3) multiplication
    4) division
  MSG
  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1,2,3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             first_number.to_i() + second_number.to_i()
           when '2'
             first_number.to_i() - second_number.to_i()
           when '3'
             first_number.to_i() * second_number.to_i()
           when '4'
             first_number.to_f() / second_number.to_f()
           end

  prompt("The answer is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
prompt("Thank you for using the calculator!")