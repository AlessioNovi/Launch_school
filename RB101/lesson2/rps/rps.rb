VALID_CHOICES = %w(rock paper scissors lizard spock)
WIN_MOVES = {
  'rock' => %w(lizard scissors),
  'lizard' => %w(spock paper),
  'spock' => %w(rock scissors),
  'scissors' => %w(paper lizard),
  'paper' => %w(rock spock)
}
player_score = []
computer_score = []

def screen_clear
  system 'clear'
end

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  WIN_MOVES[first].include?(second)
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won")
  elsif win?(computer, player)
    prompt("Computer won")
  else
    prompt("It's a tie")
  end
end

def initials_to_choice(player_choice)
  case player_choice
  when 'r'
    player_choice = 'rock'
  when 'p'
    player_choice = 'paper'
  when 'sc'
    player_choice = 'scissors'
  when 'l'
    player_choice = 'lizard'
  when 'sp'
    player_choice = 'spock'
  end
  player_choice
end

def get_input
  prompt("Pick a choice:
   r for Rock
   p for Paper
   sc for Scissors
   l for Lizard
   sp for Spock")
  player_choice = gets.chomp.downcase
  initials_to_choice(player_choice)
end

def select_choice
  player_choice = ''
  loop do
    player_choice = get_input
    break if VALID_CHOICES.include?(player_choice)
    prompt("Not a valid choice")
  end
  player_choice
end

def random_choice
  VALID_CHOICES.sample
end

def display_choices(player_choice, computer_choice)
  prompt("You chose #{player_choice}; Computer chose #{computer_choice}")
end

def add_score!(player, computer, player_score, computer_score)
  if win?(player, computer)
    player_score << "point"
  elsif win?(computer, player)
    computer_score << "point"
  else
    prompt("No points assigned")
  end
end

def reset_scores!(player_score, computer_score)
  player_score.clear
  computer_score.clear
end

def display_scores(player_score, computer_score)
  points_left = [player_score.length, computer_score.length].max
  prompt("Player has #{player_score.length} wins,
   Computer has #{computer_score.length} wins,
   #{5 - points_left} wins left to endgame")
end

def grandwinner?(player_score, computer_score)
  if player_score.length == 5
    prompt("Player is grandwinner")
    reset_scores!(player_score, computer_score)
  elsif computer_score.length == 5
    prompt("Computer is winner")
    reset_scores!(player_score, computer_score)
  end
end

def valid_answer?(answer)
  %w(y yes n no).include?(answer)
end

def get_answer
  answer = ''
  loop do
    prompt("Do you want to play again?")
    answer = gets.chomp.downcase
    break if valid_answer?(answer)
    prompt("Please choose Y, Yes, N or No as inputs")
  end
  answer
end

def play_again?
  answer = get_answer
  answer == 'y' || answer == 'yes'
end

screen_clear

prompt("Welcome to Rock Paper Scissors Spock Lizard game!")

loop do
  player_choice = select_choice
  computer_choice = random_choice
  display_choices(player_choice, computer_choice)
  display_result(player_choice, computer_choice)
  add_score!(player_choice, computer_choice, player_score, computer_score)
  display_scores(player_score, computer_score)
  grandwinner?(player_score, computer_score)
  break unless play_again?
  screen_clear
end

prompt("Thanks for playing, Bye")
