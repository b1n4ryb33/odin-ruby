require "spec_helper"
module Hangman
  RSpec.describe Game do
    context "#initialize" do

      it "initializes a new game with a guess word" do
        config = {word: "guess"}
        game = Game.new(config)
        expect(game.guess_word).to eq "guess"
      end

      it "initializes a new game with max tries" do
        config = {word: "guess", max_tries: 12}
        game = Game.new(config)
        expect(game.max_tries).to eq 12
      end

      it "initializes a new game with default 10 max tries" do
        config = {word: "guess"}
        game = Game.new(config)
        expect(game.max_tries).to eq 10
      end

      it "initializes a game with already made tries" do
        config = {word: "guess", tries: 5}
        game = Game.new(config)
        expect(game.tries).to eq 5
      end

      it "initializes a game with already guessed characters" do
        config = {word: "guess", guessed_characters: ["a", "b", "c"]}
        game = Game.new(config)
        expect(game.guessed_characters).to eq ["a", "b", "c"]
      end

    end

    context "game_over" do

      it "returns :won if won? is true" do
        allow_any_instance_of(Game).to receive(:won?).and_return(true)
        expect(Game.new({}).game_over).to eq :won
      end

      it "returns :loose if loose? is true" do
        allow_any_instance_of(Game).to receive(:loose?).and_return(true)
        expect(Game.new({}).game_over).to eq :loose
      end

      it "returns false if wonr? and loose? is false" do
        allow_any_instance_of(Game).to receive(:won?).and_return(false)
        allow_any_instance_of(Game).to receive(:loose?).and_return(false)
        expect(Game.new({}).game_over).to eq false
      end

      it "returns :won if all characters from guess_word are in guessed_characters and tries <= max tries" do
        config = {
          word: "test",
          guessed_characters: ['e', 's', 't'],
          tries: 5,
          max_tries: 10
        }
        expect(Game.new(config).game_over).to eq :won
      end

      it "returns :won if all characters from guess_word are in guessed_characters and tries <= max tries" do
        config = {
          word: "test",
          guessed_characters: ['e', 's', 't', 'a', 'u'],
          tries: 5,
          max_tries: 10
        }
        expect(Game.new(config).game_over).to eq :won
      end

      it "returns :loose if not all characters from guess_word are in guessed_characters and tries == max tries" do
        config = {
          word: "test",
          guessed_characters: ['e', 's', 'a', 'u'],
          tries: 10,
          max_tries: 10
        }
        expect(Game.new(config).game_over).to eq :loose
      end
       
      it "returns :loose if not all characters from guess_word are in guessed_characters and tries == max tries" do
        config = {
          word: "test",
          guessed_characters: ['e', 's', 'a', 'u'],
          tries: 10,
          max_tries: 10
        }
        expect(Game.new(config).game_over).to eq :loose
      end

      it "returns false if not all characters from guess_word are in guessed_characters and tries < max tries" do
        config = {
          word: "test",
          guessed_characters: ['e', 's', 'a', 'u'],
          tries: 9,
          max_tries: 10
        }
        expect(Game.new(config).game_over).to eq false
      end

    end
  end
end