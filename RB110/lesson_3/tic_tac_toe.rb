INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_STATES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                  [1, 4, 7], [2, 5, 8], [3, 6, 9], # cols
                  [1, 5, 9], [3, 5, 7]]            # diag
#
             
def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER} and the computer is #{COMPUTER_MARKER}"
  puts ""
  vertical_lines = "       |       |       "
  horizontal_lines = "-------|-------|-------"
  horizontal_count = 0

  3.times do |iter|
    offset = 3 * iter
    puts vertical_lines
    puts "   #{brd[1 + offset]}   |   #{brd[2 + offset]}   |   #{brd[3 + offset]}   "
    puts vertical_lines

    break if horizontal_count >= 2
    puts horizontal_lines
    horizontal_count += 1
  end
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each do |num|
    new_board[num] = INITIAL_MARKER
  end
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end 

def player_places_piece!(brd)
  square = ''
  loop do
    puts "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    puts "This is not a valid response!"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil
  
  # offense
  if !square
    WINNING_STATES.each do |line|
      square = find_at_risk_square(line, brd, COMPUTER_MARKER)
      break if square
    end
  end

  # defense first
  if !square
    WINNING_STATES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # middle square available?
  if (!square) && empty_squares(brd).include?(5)
    square = 5
  end

  # just pick a square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_STATES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(arr, del=', ', lst='or ')
  case arr.length
  when 0 then ''
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{lst}")
  else
    all_join_len = (arr.length - 1)
    joined = arr[0, all_join_len].join(del)
    joined << (del + lst + arr.last.to_s)
    joined
  end
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def place_piece!(brd, cr_plyr)
  (cr_plyr == 1)? player_places_piece!(brd) : computer_places_piece!(brd)
end

def alternate_player(cr_plyr)
  (cr_plyr == 1)? cr_plyr = 2 : cr_plyr = 1
end

human_score = 0
computer_score = 0
loop do
  board = initialize_board
  current_player = 1
  loop do
      puts "Who do you want to go first? Type 1 for You, 2 for the Computer, or 3 for the Computer to decide."
      current_player = gets.chomp.to_i
      current_player = [1, 2].sample if current_player == 3 
      break if [1, 2].include?(current_player)
      puts "Not a valid choice!"
  end
  
  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  if detect_winner(board) == 'Player'
    display_board(board)
    puts "You are the winner!"
    human_score += 1
    puts "The score is #{human_score} to #{computer_score}! First to 5 wins!"
  elsif detect_winner(board) == 'Computer'
    display_board(board)
    puts "The winner is the computer!"
    computer_score += 1
    puts "The score is #{human_score} to #{computer_score}! First to 5 wins!"
  elsif board_full?(board)
    display_board(board)
    puts "It's a tie!"
    puts "The score is #{human_score} to #{computer_score}! First to 5 wins!"
  end

  if human_score >= 5
    puts "Congrats! You are the champion!"
    human_score = 0
    computer_score = 0
  elsif computer_score >= 5
    puts "The computer is the champion!"
    human_score = 0
    computer_score = 0
  end

  puts "Do you want to play again? (y/n)"
  ans = gets.chomp.downcase
  break if ans == "n"
  puts "Let's play again!"
end
puts "Thanks for playing!"
