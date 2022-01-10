module Mastermind
  class Game

    def initialize
    end

    def start
      puts "Hello my Friend!"
      puts "We gave you the name guesser"
      guesser = Player.new("guesser")
      # opt. schwierigkeit
      puts "First, we play a play a normal game with 12 rounds and 4 colors."
      board = GameBoard.new()
      puts "Good luck, my friend."
      puts
      while true do
        guess = guesser.make_guess(4)
        puts board.set_guess(guess)
        puts 
        if board.game_over
          return
        end
      end

    end
    
  end
end