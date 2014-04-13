# require 'hand'

class Player

  attr_reader :money, :hand, :name
  attr_accessor :my_bet

  def initialize(money = 1_000_000, name = "Fred")
    @money = money
    @hand = Hand.new
    @my_bet = 0
    @name = name
  end

  def receive_cards(cards)
    cards.each { |card| hand.add_card(card) }
  end

  def remove_cards(cards)
    @hand.cards -= cards
  end

  def bet(amnt)
    @money -= amnt
  end

  def <=>(other)
    self.hand <=> other.hand
  end

  def get_bet(min_amnt)
    puts 'what is your bet?'
    gets.chomp.to_i
  end

  def receive_winnings(amnt)
    @money += amnt
  end

  def display_hand
    @hand.display
  end

  def discard_cards
    puts "How many cards would you like to discard?"
    gets.chomp.to_i
  end

end