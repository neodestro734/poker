require './hand'
require './deck'
require './player'
require './card'


class Game

  def initialize(player_count = 2)
    @players = Array.new(player_count) { Player.new }
    @deck = Deck.new
  end

  def play

    until over?
      deal_hands
      ask_for_bets
      get_discards
      ask_for_bets
      resolve_hand
      @deck = Deck.new
    end

  end

  private

  def deal_hands
    @players.each do |player|
      player.take_cards(@deck.deal(5))
    end
  end

  def ask_for_bets

  end

  def over?
    false
  end

  def get_discards

  end

  def resolve_hand

  end

end

Game.new.play