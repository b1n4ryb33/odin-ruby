require "spec_helper"

module TicTacToe

  describe Player do
  
    context "#initialize" do
      
      it "raises an exception when init with {}" do
        expect { Player.new({}) }.to raise_error
      end

      it "does not raise an exception when init with a valid hash" do
        expect { Player.new({sign: "X", name: "Hendrik"})}.to_not raise_error
      end
    end

    context "#sign" do
      it "provides the sign of the player" do
        player = Player.new({sign: "X", name: "Hendrik"})
        expect(player.sign).to eq "X"
      end
    end

    context "#name" do
      it "provides the name of the player" do
        player = Player.new({sign: "X", name: "Hendrik"})
        expect(player.name).to eq "Hendrik"
      end
    end
  
  end

end