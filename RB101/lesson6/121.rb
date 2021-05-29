def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  deck = { hearts: [], diamonds: [], clubs: [], spades: [] }
  jqka = [{ 'Jack' => 10 }, { 'Queen' => 10 },
          { 'King' => 10 }, { 'Ace' => 11 }]

  deck.each_key do |k|
    2.upto(10) do |n|
      deck[k] << { n.to_s => n }
    end
    jqka.each { |v| deck[k] << v }
  end
  deck
end

def random_card(deck)
  card = ''
  loop do
    suit = %w(hearts diamonds clubs spades).sample.to_sym
    cards = (0..deck[suit].length).to_a.sample
    card = deck[suit].delete_at(cards)
    break if !card.nil?
  end
  card
end

def total(hand)
  array = []
  hand.each do |h|
    array << h.values
  end
  array.flatten.sum
end

def check_for_aces(hand)
  hand.each.with_index do |card, i|
    if card.keys.join == 'Ace' && total(hand) > GAME_VERSION
      hand[i] = { 'Ace' => 1 }
    end
  end
end

def initial_cards(player_hand, dealer_hand, deck)
  player_hand << random_card(deck) << random_card(deck)
  check_for_aces(player_hand)
  dealer_hand << random_card(deck) << random_card(deck)
  check_for_aces(dealer_hand)
end

def display_player_hand(hand)
  cards = []
  hand.each { |card| cards << card.keys }
  case cards.length
  when 2
    cards.join(' and ')
  else
    cards[0..-2].join(', ').concat(' and ', cards.last.join)
  end
end

def dispay_hands(player_hand, dealer_hand, player_total, scores)
  prompt "Current points: Player #{scores[:player]}, Dealer #{scores[:dealer]}"
  prompt "Dealer has: #{dealer_hand[0].keys.join} and unknown card"
  prompt <<-TEXT
You have: #{display_player_hand(player_hand)} with a total of #{player_total}
  TEXT
end

def busted?(hand)
  hand > GAME_VERSION
end

def display_hit_or_stay
  prompt "Press Enter to Hit or any other key to stay"
end

def player_turn(player_hand, dealer_hand, deck, scores)
  answer = nil
  loop do
    clear_screen
    player_total = total(player_hand)
    dispay_hands(player_hand, dealer_hand, player_total, scores)
    display_hit_or_stay
    answer = gets
    player_hand << random_card(deck) if answer == "\n"
    check_for_aces(player_hand)
    player_total = total(player_hand)
    break if answer != "\n" || busted?(player_total)
  end
end

def dealer_turn(dealer_hand, deck)
  until total(dealer_hand) >= GAME_VERSION - 4
    dealer_hand << random_card(deck)
    check_for_aces(dealer_hand)
  end
end

def detect_winner(player_total, dealer_total)
  player_total > dealer_total ? "Player" : "Dealer"
end

def display_winner(player_total, dealer_total)
  prompt <<-TEXT
Player has total of #{player_total}
   Dealer has total of #{dealer_total}
   Winner is #{detect_winner(player_total, dealer_total)}
  TEXT
end

def display_dealer_busted(hand)
  prompt "Dealer total is #{hand} Busted!"
  prompt "Player has won"
end

def display_player_busted(hand)
  prompt "Your total is #{hand} Busted!"
  prompt "Dealer has won"
end

def display_player_turn(player_total, player_hand, dealer_hand, scores)
  if busted?(player_total)
    display_player_busted(player_total)
    clear_hands(player_hand, dealer_hand)
    scores[:dealer] += 1
  else
    display_stay
    sleep 2
  end
end

def add_score!(player_total, dealer_total, scores)
  if detect_winner(player_total, dealer_total) == "Player"
    scores[:player] += 1
  else
    scores[:dealer] += 1
  end
end

def display_game_result(dealer_total, player_total, player_hand, dealer_hand,
                        scores)
  clear_screen
  if busted?(dealer_total)
    display_dealer_busted(dealer_total)
    scores[:player] += 1
  elsif player_total == dealer_total
    display_tie(player_total, dealer_total)
  else
    display_winner(player_total, dealer_total)
    add_score!(player_total, dealer_total, scores)
  end
  clear_hands(player_hand, dealer_hand)
end

def display_tie(player_total, dealer_total)
  prompt "Your total is #{player_total}"
  prompt "Dealer total is #{dealer_total}"
  prompt "It's a tie!"
end

def display_stay
  prompt "You chose to stay!"
end

def goodbye
  prompt "Thanks for playing bye!"
end

def clear_hands(player_hand, dealer_hand)
  player_hand.clear
  dealer_hand.clear
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

def display_welcome_message
  prompt <<-TEXT
Welcome to #{GAME_VERSION} game!
 - Both players begin with two cards
  - Hit or Stay until you reach total close to #{GAME_VERSION} as possible (pass #{GAME_VERSION} and you're Busted)
   - The first one who reaches five wins is the grandwinner
    - All cards from 2-10 have face value, JQK value is 10 and Ace is 11 or 1
     - Good Luck and Have Fun!
TEXT
  sleep 6
end

def clear_screen
  system "clear"
end

def play_again?
  prompt "Do you want to play again? type Y, Yes, N or No"
  answer = retrieve_answer
  answer == 'y' || answer == 'yes'
end

def grandwinner?(scores)
  scores[:player] == 5 || scores[:dealer] == 5
end

def display_grandwinner(scores)
  if scores[:player] == 5
    prompt "Player is grandwinner!"
    reset_scores!(scores)
  elsif scores[:dealer] == 5
    prompt "Dealer is grandwinner!"
    reset_scores!(scores)
  end
end

def reset_scores!(scores)
  scores[:player] = 0
  scores[:dealer] = 0
end

GAME_VERSION = 31
player_hand = []
dealer_hand = []
scores = { player: 0, dealer: 0 }

display_welcome_message

loop do
  deck = initialize_deck
  initial_cards(player_hand, dealer_hand, deck)
  player_turn(player_hand, dealer_hand, deck, scores)
  player_total = total(player_hand)
  display_player_turn(player_total, player_hand, dealer_hand, scores)
  if !player_hand.empty?
    dealer_turn(dealer_hand, deck)
    dealer_total = total(dealer_hand)
    display_game_result(dealer_total, player_total, player_hand, dealer_hand,
                        scores)
  end
  display_grandwinner(scores) if grandwinner?(scores)
  break if !play_again?
end
clear_screen
prompt goodbye
