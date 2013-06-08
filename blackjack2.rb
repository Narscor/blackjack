# Tealeaf Academy - Intro to Ruby and Web Development
# Blackjack Game - Prodedural 

def calculate_total(cards) # for nested array
  arr = cards.map{|e| e[1] }

  total = 0
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0  # elsif code below is for J, Q, K
      total += 10
    else
      total += value.to_i 
    end
  end
  
  # Following code is to correct value for Aces
  arr.select{|e| e == "A"}.count.times do
     total -= 10 if total > 21
  end 
  
  total
end

## MAIN PROGRAM
puts "Welcome! I'm Mr. Black Jack. Let's play Blackjack!"
puts "What's your name?"
    player_name = gets.chomp
puts "Hi, #{player_name}. Let's get started. Good luck!"

cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
suits = ['H', 'S', 'D', 'C']

deck = suits.product(cards)
deck.shuffle!

# How to deal cards

player_cards = []
dealer_cards = []

player_cards << deck.pop
dealer_cards << deck.pop
player_cards << deck.pop
dealer_cards << deck.pop

dealer_total = calculate_total(dealer_cards)
player_total = calculate_total(player_cards)

# Display cards

puts "Dealer has: #{dealer_cards[0]} and #{dealer_cards[1]}, totalling #{dealer_total}."
puts "#{player_name}, you have: #{player_cards[0]} and #{player_cards[1]}, totalling #{player_total}."
puts " "

# Challenge: How can I display in the puts more than 2 arrays of cards?
# Alternative code as suggested by Kareem Rady
# puts "Dealer has: #{dealer_cards} and #{dealer_cards}, totalling #{dealer_total}."
# puts "#{player_name}, you have: #{player_cards}, totalling #{player_total}."
# puts " "

# Player turn

if player_total == 21
  puts "Congratulations, #{player_name}, you hit blackjack! You win!"
  exit
end

while player_total < 21
  puts "#{player_name}, would you like to hit or stay? 1) hit; 2) stay"
  hit_or_stay = gets.chomp

  if !['1', '2'].include?(hit_or_stay)
    puts "Error: please enter '1' or '2'"
    next
  end

  if hit_or_stay == "2"
    puts "#{player_name}, you chose to stay."
    break
  end

# Player decided to "hit"

  additional_card = deck.pop
  puts "#{player_name}, Mr. Black Jack is dealing you additional card: #{additional_card}"
  player_cards << additional_card
  player_total = calculate_total(player_cards)
  puts "#{player_name}, your cards total is now: #{player_total}"

  if player_total == 21
    puts "Congratulations, #{player_name}, you hit blackjack! You win!"
  elsif player_total > 21
    puts "Sorry, #{player_name}, it looks like you busted! Mr. Black Jack wins!"
    exit
  end
end
puts ""

# Dealer turn

if dealer_total == 21
  puts "Sorry, #{player_name}, Mr. Black Jack hit blackjack. You lose."
  exit
end


# Dealer decided to 'hit'

while dealer_total < 17
  additional_card = deck.pop
  puts "Mr. Black Jack dealing additional card for himself: #{additional_card}"
  dealer_cards << additional_card
  dealer_total = calculate_total(dealer_cards)

  if dealer_total == 21
    puts "Sorry, #{player_name}, Mr. Black Jack hit blackjack. You lose."
    exit
  elsif dealer_total > 21
    puts "Congratulations, #{player_name}, Mr. Black Jack busted. You win."
    exit
  end
end


# Dealer and Player compare hands

puts "Mr. Black Jack, the dealer, has the following cards: "
dealer_cards.each do |card|
  puts "=> #{card}"
end

puts " "

puts "#{player_name}, you have the following cards: "
player_cards.each do |card| 
  puts "=> #{card}"
end
puts " "
puts " "

puts "Dealer has: #{dealer_cards[0]} and #{dealer_cards[1]}, totalling #{dealer_total}."
puts "#{player_name}, you have: #{player_cards[0]} and #{player_cards[1]}, totalling #{player_total}."

puts " "

if dealer_total > player_total
  puts "Sorry, #{player_name}, Mr. Black Jack wins."
elsif dealer_total < player_total
  puts "Congratulations, #{player_name}, you win!"
else
  puts "It's a tie!"
end

puts "Thank you for playing Blackjack! See you next time. :-)"

exit
  

















