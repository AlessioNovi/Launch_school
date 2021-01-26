CHOICES = {
  'r' => { name: 'rock', beats: %w(scissors lizard) },
  'p' => { name: 'paper', beats: %w(rock spock) },
  'sc' => { name: 'scissors', beats: %w(paper lizard) },
  'l' => { name: 'lizard', beats: %w(spock paper) },
  'sp' => { name: 'spock', beats: %w(scissors rock) }
}
scores = { player_score: 0, computer_score: 0 }

def screen_clear
  system 'clear'
end

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  CHOICES[first][:beats].include?(CHOICES[second][:name])
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

def choice_message
  prompt("Pick a choice:")
  CHOICES.each do |key, value|
    puts "   #{key} for #{value[:name]}"
  end
end

def select_choice
  player_choice = ''
  loop do
    choice_message
    player_choice = gets.chomp.downcase
    break if CHOICES.keys.include?(player_choice)
    prompt("Not a valid choice")
  end
  player_choice
end

def random_choice
  CHOICES.keys.sample
end

def display_choices(player_choice, computer_choice)
  prompt("You chose #{CHOICES[player_choice][:name]};
   Computer chose #{CHOICES[computer_choice][:name]}")
end

def add_score!(player, computer, scores)
  if win?(player, computer)
    scores[:player_score] += 1
  elsif win?(computer, player)
    scores[:computer_score] += 1
  else
    prompt("No points assigned")
  end
end

def reset_scores!(scores)
  scores[:player_score] = 0
  scores[:computer_score] = 0
end

def display_scores(scores)
  points_left = scores.values.max
  prompt("Player has #{scores[:player_score]} wins,
   Computer has #{scores[:computer_score]} wins,
   #{5 - points_left} wins left to endgame")
end

def grandwinner?(scores)
  if scores[:player_score] == 5
    prompt("Player is grandwinner")
    reset_scores!(scores)
  elsif scores[:computer_score] == 5
    prompt("Computer is winner")
    reset_scores!(scores)
  end
end

def valid_answer?(answer)
  %w(y yes n no).include?(answer)
end

def get_answer
  answer = ''
  loop do
    prompt("Do you want to play again? Please type Y, Yes, N or No")
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
  display_scores(scores)
  player_choice = select_choice
  computer_choice = random_choice
  display_choices(player_choice, computer_choice)
  display_result(player_choice, computer_choice)
  add_score!(player_choice, computer_choice, scores)
  grandwinner?(scores)
  break unless play_again?
  screen_clear
end

prompt("Thanks for playing, Bye")
