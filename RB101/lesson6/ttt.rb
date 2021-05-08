require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
PLAYER_TURN = 1
COMPUTER_TURN = 2

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system "clear"
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
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

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(brd)})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
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

# def ai_move_check(line, brd, check)
#   if brd.values_at(*line).count(check) == 2 &&
#      brd.values_at(*line).count(INITIAL_MARKER) == 1
#      find_empty_square(line, brd)
#   else
#     nil
#   end
# end

def center_available?(brd)
  brd[5] == INITIAL_MARKER
end

def computer_places_piece!(brd)
  # square = nil
  # WINNING_LINES.each do |line|
  #   square = ai_move_check(line, brd, COMPUTER_MARKER)
  #   break if square
  # end
  # if square == nil
  #   WINNING_LINES.each do |line|
  #     square = ai_move_check(line, brd, PLAYER_MARKER)
  #     break if square
  #   end
  # end
  # return brd[5] = COMPUTER_MARKER if center_available?(brd)
  # square = empty_squares(brd).sample if square == nil
  # brd[square] = COMPUTER_MARKER
  WINNING_LINES.each do |line|
    if ai_move_check(line, brd, COMPUTER_MARKER)
      return brd[find_empty_square(line, brd)] = COMPUTER_MARKER
    end
  end
  WINNING_LINES.each do |line|
    if ai_move_check(line, brd, PLAYER_MARKER)
      return brd[find_empty_square(line, brd)] = COMPUTER_MARKER
    end
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

def display_grandwinner(scores)
  if scores["Player"] == 5
    prompt "Player is grandwinner!"
    reset_scores!(scores)
  elsif scores["Computer"] == 5
    prompt "Computer is grandwinner!"
    reset_scores!(scores)
  end
end

def valid_turn_input?(answer)
  answer.to_f == answer.to_i && [1, 2].include?(answer.to_f)
end

def who_goes_first
  prompt <<-TEXT
Please type:
   1 to be the first to begin
   2 to let computer begins
   3 to let computer decide
  TEXT
  answer = ''
  loop do
    answer = gets.chomp
    answer.to_i == 3 ? answer = (1..2).to_a.sample : nil
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
    answer = gets.chomp.downcase
    break if %w(y yes n no).include?(answer)
    prompt "Invalid input, please try again"
  end
  answer
end

def play_again?
  prompt "Do you want to play again? type Y, Yes, N or No"
  answer = retrieve_answer
  answer == 'y' || answer == 'yes'
end

scores = { "Player" => 0, "Computer" => 0 }
current_player = who_goes_first
initial_turn_mark = current_player.clone

loop do
  board = initialize_board

  loop do
    display_board(board)
    # if current_player == PLAYER_TURN
    #   player_places_piece!(board)
    #   current_player = 2
    # end
    # break if someone_won?(board) || board_full?(board)
    # if current_player == COMPUTER_TURN
    #   computer_places_piece!(board)
    #   current_player = 1
    # end
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)
  display_round_winner(board)
  add_score!(scores, board)
  display_grandwinner(scores)
  current_player = initial_turn_mark
  break unless play_again?
end

prompt "Thanks for playing Tic Tac Toe, Goodbye!"
