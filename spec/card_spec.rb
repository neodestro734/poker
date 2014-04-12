# encoding: utf-8

require 'card'

describe Card do

  subject(:card) { Card.new(:jack, :diamonds) }
  let(:jh) { Card.new(:jack, :hearts) }
  let(:h10) { Card.new(:ten, :hearts) }
  let(:s10) { Card.new(:ten, :spades) }
  let(:h9) { Card.new(:nine, :hearts) }

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

  describe "#<=>" do
    it "compares numbered cards successfully" do
      expect(h10 <=> h10).to eq(0)
      expect(h10 <=> h9).to eq(1)
      expect(h9 <=> jh).to eq(-1)
    end
  end

  describe "#display_string" do
    it "should return a string to display" do
      expect(jh.display_string).to eq("J♥ ")
    end
  end

end