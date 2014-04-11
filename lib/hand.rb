class Hand

  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def size
    @cards.size
  end

  def value
    vals = val_hash
    suits = suit_hash
    # vals.keys.max_by

    return [:flush, high_card] if suit_hash.size == 1
    return [:straight, straight] if straight
    return [:trip, val_hash.key(3)] if val_hash.values.include?(3)
    return [:two_pair, two_pair(val_hash)] if two_pair(val_hash)
    return [:pair, val_hash.key(2)] if val_hash.values.include?(2)

    [:single, @cards.max.value]
  end

  protected

  def high_card
    @cards.max.value
  end

  def val_hash
    h = Hash.new(0)
    @cards.each { |card| h[card.value] += 1}
    h
  end

  def suit_hash
    h = Hash.new(0)
    @cards.each { |card| h[card.suit] += 1}
    h
  end

  def straight
    card_vals = @cards.map { |card| card.int_value }.sort
    return :five if card_vals == [2, 3, 4, 5, 14]
    (0...4).each do |i|
      return false unless card_vals[i + 1] - card_vals[i] == 1
    end

    @cards.max.value
  end

  def two_pair(val_hash)
    partial = val_hash.select { |hash, key| key == 2}
    partial.size == 2 ? partial.keys.max : nil
  end
end