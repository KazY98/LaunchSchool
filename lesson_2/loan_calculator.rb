def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  /^-?\d+$/.match(num) && num.to_f > 0
end

loan_amount = ''
apr = ''
loan_duration = ''

prompt("Welcome to the mortgage calculator!")

loop do
  prompt("What is your loan amount?") # integer
  loop do
    loan_amount = Kernel.gets.chomp()
    if valid_number?(loan_amount)
      break
    else
      prompt("Not a valid number. Please enter a valid number:")
    end
  end

  prompt("What is your Annual Percentage Rate (APR)?") # float
  loop do
    apr = Kernel.gets.chomp()
    if valid_number?(apr)
      break
    else
      prompt("Not a valid number. Please enter a valid number:")
    end
  end

  prompt("What is your loan duration (in months)?") # integer
  loop do
    loan_duration = Kernel.gets.chomp()
    if valid_number?(loan_duration)
      break
    else
      prompt("Not a valid number. Please enter a valid number:")
    end
  end

  monthly_interest_rate = apr.to_f / (12 * 100) # decimal form
  monthly_payment = loan_amount.to_i *
                    (monthly_interest_rate / (1 - (1 +
                    monthly_interest_rate)**(-1 * loan_duration.to_i)))

  monthly_payment_rounded = monthly_payment.round(2)
  prompt("Your monthly payment will be $ #{monthly_payment_rounded}")
  prompt("Would you like you use the loan calculator again?
    (Y to calculate again)")

  ans = Kernel.gets.chomp()
  break unless ans.downcase().start_with?('y')
end
prompt("Thank you for using the loan calculator!")
