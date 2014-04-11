# encoding: utf-8

require 'deck'

describe Deck do

  subject(:deck) { Deck.new }

  describe "#initialize" do

    it "initializes" do
    expect { Deck.new }.to_not raise_error
    end

    it "initialized with 52 cards" do
      expect(deck.size).to eq(52)
    end

  end

  describe "#shuffle!" do

    # will fail for no reason one time per 52! tests
    it "changes the order the deck is in" do
      deck2 = Deck.new
      expect(deck2.shuffle!.cards).to_not eq(deck.cards)
    end

  end

  describe "#deal(num)" do

    it "should not deal more cards than in the deck" do
      expect { deck.deal(53) }.to raise_error
    end

    it "should return the number of cards asked for" do
      expect(deck.deal(3).size).to eq(3)
      expect(deck.deal(3).first.class).to eq(Card)
    end

    it "should remove cards from the deck" do
      deck.deal(12)
      expect(deck.size).to eq(40)
    end

  end


end