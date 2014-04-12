# require 'hand'

class Player
  attr_reader :money, :hand

  def initialize(money = 1_000_000)
    @money = money
    @hand = Hand.new
  end

  def take_cards(cards)
    cards.each { |card| hand.add_card(card) }
  end

  def remove_card(card)
    hand.remove_card(card)
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
    puts @hand.display
  end

  def discard_cards

  end

end