module Mastermind
  class GameBoard
    
    ROUNDS = 12
    COLORS = ["red", "blue", "yellow", "green"]

    attr_reader :secret, :guesses

    def initialize (config = {})
      @colors = config.fetch(:colors, COLORS)
      @secret = config.fetch(:secret, @colors.shuffle)
      @rounds = config.fetch(:rounds, [ROUNDS])
      @guesses = config.fetch(:guesses, Array.new())
    end

    def set_guess(guess)
      @guesses.push(guess.split(" "))
      evaluate_guess
    end

    def game_over
      return :winner if winner?
      return :looser if looser?
      false
    end

    private

    def evaluate_guess()

      current_guess = @guesses.last

      {
        colors: evaluate_colors(current_guess),
        positions: evaluate_positions(current_guess)
      }

    end

    def evaluate_colors(current_guess)
      4 - (@secret - current_guess).length
    end

    def evaluate_positions(current_guess)

      right_positions = 0

      (0..3).each do |i|
        right_positions += 1 if current_guess[i] == @secret[i] 
      end

      right_positions

    end

    def winner?
      @guesses.last.eql?(@secret)
    end

    def looser?
      @guesses.length == 12
    end

  end
  
end