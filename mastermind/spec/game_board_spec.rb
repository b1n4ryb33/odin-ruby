require "spec_helper"
module Mastermind
  RSpec.describe GameBoard do
    
    context "#initialize" do

      it "randomly selects a secret" do
        secret =["red", "green", "blue", "yellow"]
        allow_any_instance_of(Array).to receive(:shuffle).and_return(secret)
        game_board = GameBoard.new
        expect(game_board.secret).to eq secret
      end

    end

    context "#game_over" do
      
      it "returns :winner if winner? is true" do
        allow_any_instance_of(GameBoard).to receive(:winner?).and_return(true)
        expect(GameBoard.new().game_over).to eq :winner
      end

      it "returns :looser if looser? is true" do
        allow_any_instance_of(GameBoard).to receive(:looser?).and_return(true)
        expect(GameBoard.new().game_over).to eq :looser
      end

      it "returns false if winner? and looser? is false" do
        allow_any_instance_of(GameBoard).to receive(:winner?).and_return(false)
        allow_any_instance_of(GameBoard).to receive(:looser?).and_return(false)
        expect(GameBoard.new().game_over).to eq false
      end

      it "returns :winner if the last made guess equals the secret" do
        game = {secret:["red", "green", "blue", "yellow"], guesses: [["red", "green", "blue", "yellow"]]}
        game_board = GameBoard.new(game)
        expect(game_board.game_over).to eq :winner
      end

      it "returns :winner if the last made guess equals the secret" do
        game = {secret: ["red", "green", "blue", "yellow"], guesses: [["blue", "green", "blue", "yellow"], ["red", "green", "blue", "yellow"]]}
        game_board = GameBoard.new(game)
        expect(game_board.game_over).to eq :winner
      end

      it "returns :looser if 12 guesses were made and none equals the secret" do
        game = {secret: ["red", "green", "blue", "yellow"], guesses: Array.new(12, ["red", "red", "red", "yellow"])}
        game_board = GameBoard.new(game)
        expect(game_board.game_over).to eq :looser
      end

      it "returns false if neither :winner nor :looser" do
        game = {secret: ["red", "green", "blue", "yellow"], guesses: Array.new(8, ["red", "red", "red", "yellow"])}
        game_board = GameBoard.new(game)
        expect(game_board.game_over).to eq false
      end

    end

    context "#set_guess" do
      it "sets a new guess" do
        guess = "red green blue yellow"
        board = GameBoard.new
        board.set_guess(guess)
        expect(board.guesses).to eq [["red", "green", "blue", "yellow"]]
      end

      it "sets two new guesses" do
        guess_1 = "red green blue yellow"
        guess_2 = "blue green red yellow"
        board = GameBoard.new
        board.set_guess(guess_1)
        board.set_guess(guess_2)
        expect(board.guesses).to eq [["red", "green", "blue", "yellow"], ["blue", "green", "red", "yellow"]]
      end
    end

    context "#evaluate_guess" do
      it "returns a hash including the right amount of colors" do
        game = {secret:["red", "green", "blue", "yellow"]}
        game_board = GameBoard.new(game)
        guess = "red green blue blue"
        evaluation = game_board.set_guess(guess)
        expect(evaluation.fetch(:colors)).to eq 3
      end

      it "returns a hash including the right amount of colors" do
        game = {secret:["red", "green", "blue", "yellow"]}
        game_board = GameBoard.new(game)
        guess = "red green blue yellow"
        evaluation = game_board.set_guess(guess)
        expect(evaluation.fetch(:colors)).to eq 4
      end

      it "returns a hash including the right amount of colors" do
        game = {secret:["red", "green", "blue", "yellow"]}
        game_board = GameBoard.new(game)
        guess = "orange orange orange orange"
        evaluation = game_board.set_guess(guess)
        expect(evaluation.fetch(:colors)).to eq 0
      end

      it "returns a hash including the right amount of positions" do
        game = {secret:["red", "green", "blue", "yellow"]}
        game_board = GameBoard.new(game)
        guess = "red green blue yellow"
        evaluation = game_board.set_guess(guess)
        expect(evaluation.fetch(:positions)).to eq 4
      end

      it "returns a hash including the right amount of positions" do
        game = {secret:["red", "green", "blue", "yellow"]}
        game_board = GameBoard.new(game)
        guess = "red green blue orange"
        evaluation = game_board.set_guess(guess)
        expect(evaluation.fetch(:positions)).to eq 3
      end

      it "returns a hash including the right amount of positions" do
        game = {secret:["red", "green", "blue", "yellow"]}
        game_board = GameBoard.new(game)
        guess = "orange orange orange orange"
        evaluation = game_board.set_guess(guess)
        expect(evaluation.fetch(:positions)).to eq 0
      end
    end

  end
end