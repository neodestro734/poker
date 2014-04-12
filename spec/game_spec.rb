require 'game'

describe Game do

	subject(:game) { Game.new }

	describe "#initialize" do
		it "starts 2 players by default" do
			expect(game.players.count).to eq(2)
		end

		it "sets active players equal to players" do
			expect(game.players).to eq(game.active_players)
		end
	end

	describe "#betting_over?" do
		let(:bets) { { 0 => 1_000, 1 => 1_000 } }
		# game.players  #ASK ABOUT THIS LATER XXX
		game1 = Game.new
		game1.active_players
		it "stops when size is active_players and all are same bet" do
			expect(game1.betting_over?(bets)).to eq(true)
		end
		it "will not be true if bets are not all the same" do
			bets[0] = 5_000
			expect(game1.betting_over?(bets)).to eq(false)
		end
	end

end