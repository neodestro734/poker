# encoding: utf-8

require 'hand'

describe Hand do

  subject(:hand) { Hand.new }

  let(:ah) { Card.new(:ace, :hearts) }
  let(:kh) { Card.new(:king, :hearts) }
  let(:qh) { Card.new(:queen, :hearts) }
  let(:jh) { Card.new(:jack, :hearts) }
  let(:h10) { Card.new(:ten, :hearts) }
  let(:s10) { Card.new(:ten, :spades) }
  let(:h9) { Card.new(:nine, :hearts) }
  let(:s9) { Card.new(:nine, :spades) }
  let(:d9) { Card.new(:nine, :diamonds) }
  let(:c9) { Card.new(:nine, :clubs) }
  let(:c5) { Card.new(:five, :clubs) }
  let(:d3) { Card.new(:three, :diamonds) }



  # let(:j_of_d) { double("j_of_d", :suit => :diamonds, :value => :jack) }
    # let(:j_of_d) { double("j_of_d"), :suit => :diamonds, :value => :jack }
  # let(:cards) { double("cards", :[] => ) }

  describe "#initialize" do

    it "initializes" do
      expect{ hand }.to_not raise_error
    end

    it "initializes empty by default" do
      expect(hand.cards).to eq([])
    end

    it "initializes with the correct number of cards" do
      cards = [j_of_d]
      h = Hand.new(cards)
      expect(h.cards).to eq(cards)
    end

  end

  describe "#size" do
    it "gives 0 if the hand is empty" do
      expect(hand.size).to eq(0)
    end
  end

  describe "#value" do
    it "detects a royal flush"
    it "detects a straight flush"
    it "detects a four of a kind"
    it "detects a full house"
    it "detects a flush"
    it "detects a straight"
    it "detects a three of a kind"
    it "detects a two pair"
    it "detects a single pair"
    it "detects a high card"

  end

end