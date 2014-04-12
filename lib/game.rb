require_relative 'hand'
require_relative 'deck'
require_relative 'player'
require_relative 'card'


class Game

  def initialize(player_count = 2)
    # @players = Array.new(player_count) { Player.new(1_000, "Fred") }
    @players = [Player.new(1_000, "1"), Player.new(1_000, "2")]
    @active_players = @players
    @deck = Deck.new
    @pot = 0
  end

  def play

    until over?
      @players[0].hand.add_card(Card.new(:four, :spades))
      @players.each(&:display_hand)
      # deal_hands
      # ask_for_bets
      # get_discards
      # ask_for_bets
      # resolve_hand
      # @deck = Deck.new
    end

  end

  private

  def deal_hands
    @players.each do |player|
      player.take_cards(@deck.deal(5))
    end
  end

  def ask_for_bets
    # bets = Hash.new(0)
    # highest_bet = 0
    # bettor_ind = 0
    #
    # until betting_over?(bets)
    #   if @players[bettor_ind].fold?
    #   required_bet = max(100, highest_bet - bets[@players[bettor_ind]])
    #   current_bet = @players[bettor_ind].get_bet(required_bet)
    #
    #   bettor_ind = bettor_ind + 1 % @players.size
    # end
    # come back when not burnt out on this project
  end

  def betting_over?(bets)
    return false unless bets.size == @players.size
    bets.all? {|key, val| val == 0 || val == bets.first.value }
  end

  def over?
    @players.one? { |player| player.money > 0 }
  end

  def get_discards
    @players.each do |player|
      p player.name
      count = player.discard_cards
      player.remove_cards(count)
    end
  end

  def resolve_hand
    @active_players.sort.last.receive_winnings(@pot)
    @pot = 0
  end

end

Game.new.play

















