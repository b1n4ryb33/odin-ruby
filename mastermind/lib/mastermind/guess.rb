module Mastermind
  class Guess

    attr_reader :value

    def initialize (value = default_value)
      @value = value
    end
  
    private
    def default_value
      ["","","",""]
    end

  end
end