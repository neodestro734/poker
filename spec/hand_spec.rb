# encoding: utf-8

require 'hand'
require 'card'

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
      cards = [jh]
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
    it "detects a royal flush" do
      expect(Hand.new([kh,qh,jh,h10,ah]).value).to eq([:royal_flush, :ace])
    end
    it "detects a straight flush" do
      expect(Hand.new([kh,qh,jh,h10,h9]).value).to eq([:straight_flush, :king])
    end
    it "detects a four of a kind" do
      expect(Hand.new([h9,d9,c9,s9,ah]).value).to eq([:quad, :nine])
    end
    it "detects a full house" do
      expect(Hand.new([h10,s10,c9,s9,d9]).value).to eq([:full_house, :nine])
    end
    it "detects a flush" do
      expect(Hand.new([ah, kh, qh, jh, h9]).value).to eq([:flush, :ace])
    end
    it "detects a straight" do
      expect(Hand.new([kh,qh,jh,h10,s9]).value).to eq([:straight, :king])
    end
    it "detects a three of a kind" do
      expect(Hand.new([d3,d9,c9,s9,ah]).value).to eq([:trip, :nine])
    end
    it "detects a two pair" do
      expect(Hand.new([h10,s10,c9,s9,ah]).value).to eq([:two_pair, :ten])
    end
    it "detects a single pair" do
      expect(Hand.new([d3,c5,c9,s9,ah]).value).to eq([:pair, :nine])
    end
    it "detects a high card" do
      expect(Hand.new([d3,c5,c9,s10,ah]).value).to eq([:single, :ace])
    end

  end

  describe "#<=>" do
    it "three of a kind beats a pair" do
      pair = Hand.new([d3,c5,c9,s9,ah])
      trips = Hand.new([d3,d9,c9,s9,ah])
      expect(pair <=> trips).to eq(-1)
    end
    specify "high pair beats low pair" do
      low = Hand.new([d3,c5,c9,s9,ah])
      high = Hand.new([d3,c5,h10,s10,ah])
      expect(high <=> low).to eq(1)
    end
    specify "pair with high card beats other pair with lower high card" do
      low = Hand.new([d3,c5,c9,s9,kh])
      high = Hand.new([d3,c5,c9,s9,ah])
      expect(high <=> low).to eq(1)
    end
  end

  describe "#display" do
    it "prints the display string" do
      expect(Hand.new([ah, kh]).display).to eq("A♥ K♥ ")
    end
  end

end