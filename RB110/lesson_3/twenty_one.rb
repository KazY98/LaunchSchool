GOAL_VALUE = 51
DEALER_STOP = 47
CARD_VALUES = {
  '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
  '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'Jack' => 10,
  'Queen' => 10, 'King' => 10, 'Ace' => [11, 1]
}


def initialize_deck # {card symbol => amount left in deck}
  deck = ('2'..'10').to_a
  deck += ['Jack', 'Queen', 'King', 'Ace']
  (deck * 4).shuffle!
end

def deal_cards!(dk, plyr_hnd, dlr_hnd)
  plyr_hnd << dk.pop(2)
  plyr_hnd.flatten!
  dlr_hnd << dk.pop(2)
  dlr_hnd.flatten!
end

def joinand(arr)
  if arr.length == 2
    arr.join(" and ")
  else
    all_join_len = (arr.length - 1)
    joined = arr[0, all_join_len].join(', ')
    joined << (", and #{arr.last}")
    joined
  end
end

def hit!(dk, hnd)
  hnd << dk.pop
  hnd.flatten!
end

def hit_or_stay # "h" or "s"
  ans = ''
  loop do
    puts "Do you want to hit or stay?"
    ans = gets.chomp.downcase
    ans = 'h' if ans == 'hit'
    ans = 's' if ans == 'stay'
    break if ans == 'h' || ans == 's'
    puts "That is not a valid answer"
  end
  ans
end

def bust?(hnd)
  hnd > GOAL_VALUE
end

def total(hnd)
  value = 0

  hnd.each do |card|
    if card == 'Ace'
      value += 11
    else
      value += CARD_VALUES[card]
    end
  end

  hnd.count("Ace").times do
    value -= 10 if value > GOAL_VALUE
  end

  value
end

def play_again?
  puts "Do you want to play again? (y/n)"
  ans = gets.chomp.downcase
  ans.start_with?('y')
end

def end_round_message(plyr_hnd, dlr_hnd, plyr_tot, dlr_tot)
  puts "=============="
  puts "Dealer has #{dlr_hnd}, for a total of: #{dlr_tot}"
  puts "Player has #{plyr_hnd}, for a total of: #{plyr_tot}"
  puts "=============="
end

player_wins = 0
dealer_wins = 0
puts "First to 5 wins is the Grand Winner!"
loop do
  deck = initialize_deck
  dealer_hand = []
  player_hand = []
  deal_cards!(deck, player_hand, dealer_hand)
  player_total = total(player_hand)
  dealer_total = total(dealer_hand)
  # you and dealer have 2 element array
  puts "Dealer has: #{dealer_hand[0]} and an unkown card"
  puts "You have: #{joinand(player_hand)}, for a total of #{player_total}"

  loop do # player loop
    response = hit_or_stay
    break if response == 's'

    hit!(deck, player_hand)
    player_total = total(player_hand)
    
    puts "You chose hit!"
    puts "Your cards are: #{joinand(player_hand)} "
    puts "Your total is: #{player_total}"

    break if bust?(player_total)
  end

  if bust?(player_total)
    end_round_message(player_hand, dealer_hand, player_total, dealer_total)
    puts "You went over #{GOAL_VALUE}! The Dealer wins!"
    dealer_wins += 1
    puts "The score is #{player_wins} You to #{dealer_wins} the Dealer"
    
    break if dealer_wins == 5
    play_again? ? next : break
  end

  loop do
    puts "Dealer has: #{joinand(dealer_hand)}"
    puts "The Dealers total is #{dealer_total}"
    break if dealer_total >= DEALER_STOP
    hit!(deck, dealer_hand)
    puts "The Dealer chose hit!"
    dealer_total = total(dealer_hand)
  end

  if bust?(dealer_total)
    end_round_message(player_hand, dealer_hand, player_total, dealer_total)
    puts "The Dealer went over #{GOAL_VALUE}! You win!"
    player_wins += 1
    puts "The score is #{player_wins} You to #{dealer_wins} the Dealer"
    break if player_wins == 5
    play_again? ? next : break
  end

  end_round_message(player_hand, dealer_hand, player_total, dealer_total)

  if player_total > dealer_total
    player_wins +=1
    break if player_wins == 5 
    puts "You Win!"
  elsif player_total < dealer_total
    dealer_wins +=1
    break if dealer_wins == 5 
    puts "You Lose!"
  else
    puts "It's a tie!"
  end

  puts "The score is #{player_wins} You to #{dealer_wins} the Dealer"
  break unless play_again?
end

if player_wins == 5
  puts "You are the Grand Winner!"
elsif dealer_wins == 5
  puts "The Dealer is the Grand Winner!"
end

puts "Thanks for playing!"
