require_relative 'hand'
require_relative 'deck'
require_relative 'player'
require_relative 'card'
require 'debugger'


class Game

  attr_reader :players, :active_players

  def initialize(player_count = 2)
    # @players = Array.new(player_count) { Player.new(1_000, "Fred") }
    @players = [Player.new(1_000, "1"), Player.new(1_000, "2")]
    @active_players = @players
    @deck = Deck.new
    @pot = 0
  end

  def play

    until over?
      deal_hands
      @players.each(&:display_hand)
      @active_players = @players
      bets = ask_for_bets
      puts 'betting is over'
      @pot = @players.inject(0) { |sum, p| sum + p.my_bet }
      p @pot
      # get_discards
      # ask_for_bets
      # resolve_hand
      # @deck = Deck.new
      break
    end

  end

  # private

  def deal_hands
    @players.each do |player|
      player.receive_cards(@deck.deal(5))
    end
  end

  def ask_for_bets
    bets = Hash.new(0)
    highest_bet = 0
    bettor_ind = 0

    until betting_over?(bets)
      cur_bettor = active_players[bettor_ind]
      required_bet = [100, highest_bet].max
      p required_bet
      bet = get_bet_or_fold(cur_bettor, required_bet)

      if bet == -1
        active_players.delete(cur_bettor)
        bettor_ind = (bettor_ind ) % @active_players.size
        next
      end

      cur_bettor.my_bet = bet
      cur_bettor.bet(bet)
      bets[cur_bettor] = bet
      highest_bet = bet if bet > highest_bet
      bettor_ind = (bettor_ind + 1) % @active_players.size
    end
    bets
  end

  def get_bet_or_fold(player, required_bet)
    bet = 0
    begin
      puts "#{player.name}, what would you like to bet? Type -1 to fold:"
      bet = gets.chomp.to_i
      if bet < required_bet && bet != -1
        raise InvalidBetAmount.new("Must bet minimum of #{required_bet}")
      end
    rescue InvalidBetAmount => e
      puts e
      retry
    rescue => e
      puts "Error with input, please try again"
      retry
    end
    bet
  end

  def betting_over?(bets)
    return false unless bets.size == @active_players.size
    bets.all? {|key, val| val == bets.values.first }
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

class InvalidBetAmount < ArgumentError
end

Game.new.play

















