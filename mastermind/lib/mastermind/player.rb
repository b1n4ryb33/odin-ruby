module Mastermind
  class Player
    
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def make_guess(difficulty = 4)
      
      puts "#{@name} please enter a guess with #{difficulty} colors, e.g. red green blue yellow ..."

      begin
        puts "Enter a guess>>"
        guess = Kernel.gets.chomp #.match(/(red |blue |green |yellow ){#{difficulty}}/)
      rescue
        puts "Erroneous input! Try again..."
        retry
      else
        return guess
      end  
    end

  end
end