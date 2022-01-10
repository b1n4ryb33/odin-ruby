module TicTacToe

  class Player
  
    attr_reader :sign, :name
    def initialize(input)
      @sign = input.fetch(:sign)
      @name = input.fetch(:name)
    end
  
  end

end