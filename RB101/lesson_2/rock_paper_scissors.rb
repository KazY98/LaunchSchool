VALID_OPTIONS = ['rock', 'paper', 'scissors','lizard','spock']

WINNING_HASH = {
  'rock'     => ['scissors', 'lizard'],
  'paper'    => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard'   => ['paper', 'spock'],
  'spock'    => ['rock', 'scissors']
}

ABBREVIATION = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock',
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_choice?(chce)
  VALID_OPTIONS.include?(chce) || ABBREVIATION.include?(chce)
end

def abbrev_to_full(abbr)
  if ABBREVIATION.key?(abbr)
    ABBREVIATION[abbr] 
  else
    abbr
  end
end

def display_results(player, computer)
  if WINNING_HASH[player].include?(computer)
    prompt("You won!")
  elsif player == computer
    prompt("It's a tie!")
  else
    prompt("You lose!")
  end
end

def winner(player, computer)
  if WINNING_HASH[player].include?(computer)
    [1,0]
  elsif WINNING_HASH[computer].include?(player)
    [0,1]
  else
    [0,0]
  end
end


player_score = 0
computer_score = 0 
loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_OPTIONS.join(', ')}")
    choice = Kernel.gets().chomp().downcase()

    break if valid_choice?(choice)
    prompt("Not a valid choice.")
  end

  choice = abbrev_to_full(choice)
  
  computer_choice = VALID_OPTIONS.sample()

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  player_score += winner(choice, computer_choice)[0]
  computer_score += winner(choice, computer_choice)[1]

  prompt("The score is you: [#{player_score}] to the computer: [#{computer_score}]!")

  if player_score == 3 
    prompt("The grand winner is... you!")
    break
  elsif computer_score == 3
    prompt("The grand winner is... the computer!")
    break
  end

  prompt("Would you like to keep playing? (y/n)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for playing")
