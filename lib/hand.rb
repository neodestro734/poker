class Hand

  attr_reader :cards


  def initialize(cards = [])
    @cards = cards
  end

  def size
    @cards.size
  end




  protected



  def is_straight?

  end

  def is_flush?

  end

  def count_same_value

  end



end