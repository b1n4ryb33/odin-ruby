module TicTacToe

  class Player
    
    attr_accessor :symbol, :games
    attr_reader :name, :score

    def initialize(input)
      @name = input.fetch(:name)
      @symbol = input.fetch(:symbol)
      @games = input.fetch(:games, [])
      @score = input.fetch(:score, 0)
    end

    def choose_field
        
      puts "#{@name} please enter a position to make your choice."

      begin
        puts "Enter a number>>"
        num = Kernel.gets.chomp.match(/\d+/)[0]
        raise PositionToHighLowError if num.to_i > 9 || num.to_i < 1
      rescue NoMethodError
        puts "Erroneous input! Try again..."
        retry
      rescue PositionToHighLowError
        puts 'Position to high or to low. Ranges from 1 to 9. Try again...'
        retry
      else  
        return human_move_to_position(num)
      end  

    end

    private

    def human_move_to_position(human_move)
      mapping = {
        "7" => [0, 0],
        "8" => [1, 0],
        "9" => [2, 0],
        "4" => [0, 1],
        "5" => [1, 1],
        "6" => [2, 1],
        "1" => [0, 2],
        "2" => [1, 2],
        "3" => [2, 2]
      }
      mapping[human_move]
    end

  end
  
end