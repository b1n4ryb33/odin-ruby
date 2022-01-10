require "spec_helper"
module Mastermind

  RSpec.describe Guess do
    context "#initialize" do
      
      it "initialize a guess with an string array of 4 values" do
        user_input = ["red", "red", "green", "blue"]
        guess = Guess.new(user_input)
        expect(guess.value).to eq user_input
      end

      it "initialize a guess with an array of 4 empty strings by default" do
        guess = Guess.new()
        expect(guess.value).to eq ["", "", "", ""]
      end

    end
  end

end