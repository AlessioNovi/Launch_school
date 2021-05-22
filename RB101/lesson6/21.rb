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
    if card.keys.join == 'Ace' && total(hand) <= 21
      hand[i] = { 'Ace' => 11 }
    elsif card.keys.join == 'Ace' && total(hand) > 21
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

def dispay_hands(player_hand, dealer_hand)
  prompt "Dealer has: #{dealer_hand[0].keys.join} and unknown card"
  prompt <<-TEXT
You have: #{display_player_hand(player_hand)} with a total of #{total(player_hand)}
  TEXT
end

def busted?(hand)
  total(hand) > 21
end

def display_hit_or_stay
  prompt "Press Enter to Hit or any other key to stay"
end

def player_turn(player_hand, dealer_hand, deck)
  answer = nil
  loop do
    clear_screen
    dispay_hands(player_hand, dealer_hand)
    display_hit_or_stay
    answer = gets
    check_for_aces(player_hand)
    player_hand << random_card(deck) if answer == "\n"
    check_for_aces(player_hand)
    break if answer != "\n" || busted?(player_hand)
  end
end

def dealer_turn(dealer_hand, deck)
  until total(dealer_hand) >= 17
    check_for_aces(dealer_hand)
    dealer_hand << random_card(deck)
    check_for_aces(dealer_hand)
    dealer_hand
  end
end

def detect_winner(player_hand, dealer_hand)
  total(player_hand) > total(dealer_hand) ? "Player" : "Dealer"
end

def display_winner(player_hand, dealer_hand)
  prompt <<-TEXT
Player has total of #{total(player_hand)}
   Dealer has total of #{total(dealer_hand)}
   Winner is #{detect_winner(player_hand, dealer_hand)}
  TEXT
end

def display_dealer_busted(hand)
  prompt "Dealer total is #{total(hand)} Busted!"
  prompt "Player has won"
end

def display_player_busted(hand)
  prompt "Your total is #{total(hand)} Busted!"
  prompt "Dealer has won"
end

def player_turn_result(player_hand, dealer_hand)
  if busted?(player_hand)
    display_player_busted(player_hand)
    clear_hands(player_hand, dealer_hand)
  else
    display_stay
  end
end

def display_game_result(player_hand, dealer_hand)
  clear_screen
  if busted?(dealer_hand)
    display_dealer_busted(dealer_hand)
  elsif total(player_hand) == total(dealer_hand)
    display_tie(player_hand, dealer_hand)
  else
    display_winner(player_hand, dealer_hand)
  end
  clear_hands(player_hand, dealer_hand)
end

def display_tie(player_hand, dealer_hand)
  prompt "Your total is #{total(player_hand)}"
  prompt "Dealer total is #{total(dealer_hand)}"
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
Welcome to 21 game!
 - Both players begins with two cards
  - Hit or Stay until you reach total close to 21 as possible (pass 21 and you're Busted)
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

player_hand = []
dealer_hand = []

display_welcome_message

loop do
  deck = initialize_deck
  initial_cards(player_hand, dealer_hand, deck)
  player_turn(player_hand, dealer_hand, deck)
  player_turn_result(player_hand, dealer_hand)
  break if busted?(player_hand) && !play_again?
  if !player_hand.empty?
    dealer_turn(dealer_hand, deck)
    display_game_result(player_hand, dealer_hand)
  end
  break if !play_again?
end

prompt goodbye
