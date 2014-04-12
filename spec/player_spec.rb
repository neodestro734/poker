require 'player'
require 'card'

describe Player do
  subject(:bob) { Player.new }
  let(:c1) { Card.new(:jack, :hearts) }

  it 'initializes with moneys and an empty hand' do
    expect(bob.money).to eq(1_000_000)
    expect(bob.hand.cards.empty?).to be(true)
  end

  describe '#receive_cards' do

    it 'receives five cards' do
      bob.receive_cards([c1,c1,c1,c1,c1])
      expect(bob.hand.size).to eq(5)
    end

  end

  describe '#remove_card' do

    it 'adding a card and then removing it leaves with an empty hand' do
      bob.receive_cards([c1])
      bob.remove_cards([c1])
      expect(bob.hand.cards.empty?).to be(true)
    end
  end

  describe '#bet(amnt)' do
    it 'leaves you with fewer moneys' do
      bob.bet(1)
      expect(bob.money).to eq(999_999)
    end
  end
end