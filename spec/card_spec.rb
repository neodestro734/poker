# encoding: utf-8

require 'card'

describe Card do

  subject(:card) { Card.new(:jack, :diamonds) }

  describe "#initialize" do
    it "makes a jack of diamonds" do
      expect { card }.to_not raise_error
    end

    it "returns the correct card (jack of diamonds)" do
      expect(card.suit).to eq(:diamonds)
      expect(card.value).to eq(:jack)
    end
  end

  describe "has methods" do
    it { should respond_to(:suit, :value) }
  end

end