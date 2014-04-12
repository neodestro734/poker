# encoding: utf-8
# require 'ruby-debug'
# require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    add_cards
    shuffle!
  end

  def shuffle!
    @cards.shuffle!
    self
  end

  def deal(num)
    raise 'not enough cards' if num > @cards.size
    [].tap do |arr|
      num.times { arr << @cards.pop }
    end
  end

  def size
    @cards.size
  end

  protected

  def add_cards
    Card.suits.each do |suit|
      Card.values.each do |value|
        @cards << Card.new(value, suit)
      end
    end
  end

end

# deck = Deck.new
# disp_string = deck.cards.map(&:display)
# p disp_string.count