WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
PLAYER_TURN = 1
COMPUTER_TURN = 2
scores = { "Player" => 0, "Computer" => 0 }

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, scores)
  system "clear"
  puts "     You're a #{PLAYER_MARKER} Computer is #{COMPUTER_MARKER}"
  puts "  Player #{scores["Player"]} points Computer #{scores["Computer"]} points"
  puts ""
  puts "           |     |"
  puts "        #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "           |     |"
  puts "      -----+-----+-----"
  puts "           |     |"
  puts "        #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "           |     |"
  puts "      -----+-----+-----"
  puts "           |     |"
  puts "        #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "           |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(brd)
  square_arr = empty_squares(brd)
  if square_arr.size == 2
    "#{square_arr.first} or #{square_arr.last}"
  elsif square_arr.size > 1
    "#{square_arr[0..-2].join(', ')} or #{square_arr.last}"
  else
    square_arr.join
  end
end

def valid_choice?(square)
  square.to_i.to_s == square
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(brd)})"
    square = gets.chomp
    break if empty_squares(brd).include?(square.to_i) && valid_choice?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square.to_i] = PLAYER_MARKER
end

def find_empty_square(line, brd)
  line.each do |num|
    return num if brd[num] == INITIAL_MARKER
  end
end

def ai_move_check(line, brd, check)
  brd.values_at(*line).count(check) == 2 &&
    brd.values_at(*line).count(INITIAL_MARKER) == 1
end

def center_available?(brd)
  brd[5] == INITIAL_MARKER
end

def ai_strategic_gameplay(brd, check)
  WINNING_LINES.each do |line|
    if ai_move_check(line, brd, check)
      return brd[find_empty_square(line, brd)] = COMPUTER_MARKER
    end
  end
  nil
end

def computer_places_piece!(brd)
  if !!ai_strategic_gameplay(brd, COMPUTER_MARKER)
    return ai_strategic_gameplay(brd, COMPUTER_MARKER)
  end
  if !!ai_strategic_gameplay(brd, PLAYER_MARKER)
    return ai_strategic_gameplay(brd, PLAYER_MARKER)
  end
  return brd[5] = COMPUTER_MARKER if center_available?(brd)
  brd[empty_squares(brd).sample] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def display_round_winner(board)
  if someone_won?(board)
    prompt "#{detect_winner(board)} Won!"
  else
    prompt "It's a Tie"
  end
end

def add_score!(scores, brd)
  if detect_winner(brd) == "Player"
    scores["Player"] += 1
  elsif detect_winner(brd) == "Computer"
    scores["Computer"] += 1
  end
end

def reset_scores!(scores)
  scores["Player"] = 0
  scores["Computer"] = 0
end

def grandwinner?(scores)
  scores["Player"] == 5 || scores["Computer"] == 5
end

def display_grandwinner(scores)
  if scores["Player"] == 5
    prompt "Player is grandwinner!"
  elsif scores["Computer"] == 5
    prompt "Computer is grandwinner!"
  end
  reset_scores!(scores)
end

def valid_turn_input?(answer)
  answer.to_i.to_s == answer.to_s && [1, 2].include?(answer.to_f)
end

def display_decide_first_player
  prompt <<-TEXT
Please type:
   1 to be the first to begin
   2 to let computer begins
   3 to let computer decide
TEXT
end

def who_goes_first
  display_decide_first_player
  answer = ''
  loop do
    answer = gets.chomp.strip
    answer.to_f == 3 ? answer = (1..2).to_a.sample : nil
    break if valid_turn_input?(answer)
    prompt "Invalid input, please try again"
  end
  answer.to_i
end

def place_piece!(brd, current_player)
  current_player == 1 ? player_places_piece!(brd) : computer_places_piece!(brd)
end

def alternate_player(current_player)
  current_player == 1 ? 2 : 1
end

def retrieve_answer
  answer = ''
  loop do
    answer = gets.chomp.downcase.strip
    break if %w(y yes n no).include?(answer)
    prompt "Invalid input, please try again"
  end
  answer
end

def play_one_round(board, current_player, scores)
  loop do
    display_board(board, scores)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end
end

def play_again?
  prompt "Do you want to play again? type Y, Yes, N or No"
  answer = retrieve_answer
  answer == 'y' || answer == 'yes'
end

def exit_game?
  prompt "Do you want to exit game? type Y, Yes, N or No"
  answer = retrieve_answer
  answer == 'y' || answer == 'yes'
end

def display_welcome_message
prompt <<-TEXT
Welcome to Tic Tac Toe game!
   The player who succeeds in placing three of their marks in a diagonal, horizontal, or vertical row is the winner.
   Reach 5 wins to be the grandwinner of the game!
TEXT
end


display_welcome_message

loop do
  current_player = who_goes_first
  loop do
    board = initialize_board
    play_one_round(board, current_player, scores)
    display_board(board, scores)
    display_round_winner(board)
    add_score!(scores, board)
    break if grandwinner?(scores) || !play_again?
  end
  display_grandwinner(scores) if grandwinner?(scores)
  break if exit_game?
end

prompt "Thanks for playing Tic Tac Toe, Goodbye!"
