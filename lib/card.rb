# encoding: utf-8

class Card

  SUIT_STRINGS = {
      :clubs    => "♣",
      :diamonds => "♦",
      :hearts   => "♥",
      :spades   => "♠"
    }

    VALUE_STRINGS = {
      :deuce => "2",
      :three => "3",
      :four  => "4",
      :five  => "5",
      :six   => "6",
      :seven => "7",
      :eight => "8",
      :nine  => "9",
      :ten   => "T",
      :jack  => "J",
      :queen => "Q",
      :king  => "K",
      :ace   => "A"
    }

    VALUE_NUMS = {
      :deuce => 2,
      :three => 3,
      :four  => 4,
      :five  => 5,
      :six   => 6,
      :seven => 7,
      :eight => 8,
      :nine  => 9,
      :ten   => 10,
      :jack  => 11,
      :queen => 12,
      :king  => 13,
      :ace   => 14
    }


  attr_reader :suit, :value

  def <=>(other_card)
    return 1 if VALUE_NUMS[self.value] > VALUE_NUMS[other_card.value]
    return 0 if VALUE_NUMS[self.value] == VALUE_NUMS[other_card.value]
    return -1 if VALUE_NUMS[self.value] < VALUE_NUMS[other_card.value]
  end

  def int_value
    VALUE_NUMS[self.value]
  end

  def initialize(value, suit)
    @suit, @value = suit, value
  end

  def self.suits
    SUIT_STRINGS.keys
  end

  def self.values
    VALUE_STRINGS.keys
  end

end