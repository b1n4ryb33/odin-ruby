require "spec_helper"

module TicTacToe
  describe Player do
    
    context "#initialize" do
      it "initis a player with a name" do
        player = Player.new(name: "Frank")
        expect(player.name).to eq "Frank"
      end
    end

    # context "#choose_field" do
    #   it "raises an error if player does not enter a number" do
    #     player = Player.new(name: "Frank")
    #     player.stub(gets: "10")
    #     # Array.any_instance.stub() {raise NoMethodError}
    #     msg = "Position to high or to low. Ranges from 1 to 9. Try again..."
    #     expect {player.choose_field}.to output(msg).to_stdout
    #     # expect(true).to be_truthy
    #   end

      # it "lets human player enter a number and returns this" do
      #   player = Player.new(name: "Frank")
      #   player.stub(gets: "4")
      #   expect(player.choose_field).to eq 4
      # end

      # it "raises a PositionToHighError if user enters a to high position" do
      #   player = Player.new(name: "Frank")
      #   player.stub(gets: "10")
      #   expect {player.choose_field}.to raise_error
      # end

    end
  end
end