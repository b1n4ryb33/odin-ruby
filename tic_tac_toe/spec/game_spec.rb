require "spec_helper"

module TicTacToe
  describe Game do
 
    let (:bob) { Player.new({symbol: "X", name: "bob"}) }
    let (:frank) { Player.new({symbol: "O", name: "frank"}) }
 
    context "#initialize" do
      it "randomly selects a current_player" do
        Array.any_instance.stub(:shuffle) { [frank, bob] }
        game = Game.new([bob, frank])
        expect(game.current_player).to eq frank
      end
 
      it "randomly selects an other player" do
        Array.any_instance.stub(:shuffle) { [frank, bob] }
        game = Game.new([bob, frank])
        expect(game.other_player).to eq bob
      end
    end

    context "#switch_players" do
      it "will set @current_player to @other_player" do
        game = Game.new([bob, frank])
        other_player = game.other_player
        game.switch_players
        expect(game.current_player).to eq other_player
      end
     
      it "will set @other_player to @current_player" do
        game = Game.new([bob, frank])
        current_player = game.current_player
        game.switch_players
        expect(game.other_player).to eq current_player
      end
    end
 
    context "#game_over_message" do
      it "returns '{current player name} won!' if board shows a winner" do
        game = Game.new([bob, frank])
        game.stub(:current_player) { bob }
        game.board.stub(:game_over) { :winner }
        expect(game.game_over_message).to eq "bob won!"
      end
     
      it "returns 'The game ended in a tie' if board shows a draw" do
        game = Game.new([bob, frank])
        game.stub(:current_player) { bob }
        game.board.stub(:game_over) { :draw }
        expect(game.game_over_message).to eq "The game ended in a tie"
      end
    end

  end
end