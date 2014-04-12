class Hand

  attr_accessor :cards

  HAND_RANK = {single: 0, pair: 1, two_pair: 2, trip: 3, straight: 4, flush: 5,
    full_house: 6, quad: 7, straight_flush: 8, royal_flush: 9}

  def initialize(cards = [])
    @cards = cards
  end

  def size
    @cards.size
  end

  def display
    disp_string = @cards.map(&:display_string).join('')
    print disp_string
    disp_string
  end

  def value
    vals = val_hash
    suits = suit_hash
    # vals.keys.max_by
    if straight && suit_hash.size == 1 && high_card == :ace
       return [:royal_flush, :ace]
    end
    return [:straight_flush, high_card] if straight && suit_hash.size == 1
    return [:quad, val_hash.key(4)] if val_hash.values.include?(4)
    return [:full_house, val_hash.key(3)] if val_hash.size == 2
    return [:flush, high_card] if suit_hash.size == 1
    return [:straight, straight] if straight
    return [:trip, val_hash.key(3)] if val_hash.values.include?(3)
    return [:two_pair, two_pair(val_hash)] if two_pair(val_hash)
    return [:pair, val_hash.key(2)] if val_hash.values.include?(2)

    [:single, @cards.max.value]
  end

  def <=>(other)
    return 1 if HAND_RANK[self.value.first] > HAND_RANK[other.value.first]
    return -1 if HAND_RANK[self.value.first] < HAND_RANK[other.value.first]

    #hand_rank is 0
    return 1 if Card.int_value(self.value.last) > Card.int_value(other.value.last)
    return -1 if Card.int_value(self.value.last) < Card.int_value(other.value.last)

    #compare high card
    # self.high_card <=> other.high_card
    our_high = val_hash.select{ |k, v| v == 1 }.keys.max_by { |sym| Card.int_value(sym) }
    their_high = other.val_hash.select{ |k, v| v == 1 }.keys.max_by { |sym| Card.int_value(sym) }

    Card.int_value(our_high) <=> Card.int_value(their_high)
  end

  def add_card(card)
    @cards << card
  end

  def remove_card(card)
    @cards.delete_if { |cand| cand == card }
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

