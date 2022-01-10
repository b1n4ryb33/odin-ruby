require "spec_helper"
module Mastermind

  RSpec.describe Player do

    context "#initialize" do
      
      it "initialize a player with a name" do
        user_input = "test player"
        player = Player.new(user_input)
        expect(player.name).to eq user_input
      end

    end

  end
end