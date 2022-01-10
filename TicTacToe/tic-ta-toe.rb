class Game

  # @@games

  def initialize()
    @game_field = GameField.new()
    @players = []
    @is_draw = false
    @winner = ""
  end

  def add_players(players)
    @players = players
    players.each {|player| player.current_game = self}
    players[0].current_sign = "O"
    players[1].current_sign = "X"
  end

  def start()
    # do prober error handling
    return nil if @players.length < 2;

    is_winning_or_draw = false

    while !is_winning_or_draw
      is_winning_or_draw  = play_round()
    end

    # publish result
    puts "#{@winner} has won the game." if !@is_draw
    puts "No one has won the game." if @is_draw
        
  end
  
  def set_field(num, sign)
    @game_field.set_field(num, sign)
  end

  private

  def play_round()

    make_move(@players[0])
    @game_field.print_game_field()
    return true if is_winning?(@players[0]) || is_draw?

    make_move(@players[1])
    @game_field.print_game_field()
    is_winning?(@players[1]) || is_draw?
  end

  def make_move(player)
    begin
      player.make_move()
    rescue PositionAlreadySetError => exception
      puts exception.message
      retry
    rescue PositionToHighError => exception
      puts exception.message
      retry
    rescue NoRunningGameError => exception
      puts exception.message
      abort()
    end
  end

  def is_winning?(player)
    is_winning = @game_field.is_winning_position?(player.current_sign)
    
    if is_winning
      @winner = player.name
      return is_winning 
    end
  end

  def is_draw?()
    @is_draw = @game_field.is_draw_position?
    @game_field.is_draw_position?
  end

  def abort()
    puts "Aborting the game."
  end

end

class GameField

  def initialize()
    @fields = ["", "", "", "", "", "", "", "", ""]
  end

  def print_game_field()
    puts "#{@fields[0]} | #{@fields[1]} | #{@fields[2]}"
    puts "#{@fields[3]} | #{@fields[4]} | #{@fields[5]}"
    puts "#{@fields[6]} | #{@fields[7]} | #{@fields[8]}"
  end

  def set_field(position, sign)
    
    raise PositionToHighError, 'Position to high. Ranges from 1 to 9. Please try again.' if position > 9 || position < 1
    
    raise PositionAlreadySetError, 'Position is already set. Please try again.' if @fields[position - 1] != ""
    
    @fields[position - 1] = sign 

  end

  def is_winning_position?(sign)
    check_winning?(sign)
  end

  def is_draw_position?()
    check_draw?()
  end

  private

  def check_winning?(sign)

    return true if @fields[0..2].all?{|field| field == sign}
    return true if @fields[3..5].all?{|field| field == sign}
    return true if @fields[6..8].all?{|field| field == sign}

    return true if [@fields[0], @fields[3], @fields[6]].all?{|field| field == sign}
    return true if [@fields[1], @fields[4], @fields[7]].all?{|field| field == sign}
    return true if [@fields[2], @fields[5], @fields[8]].all?{|field| field == sign}

    return true if [@fields[0], @fields[4], @fields[8]].all?{|field| field == sign}
    return true if [@fields[2], @fields[4], @fields[6]].all?{|field| field == sign}

    false 

  end

  def check_draw?()
    return true if @fields.all?{|field| field != ""} && !(self.check_winning?("X") || self.check_winning?("O"))
  end

end

class Player

  attr_accessor :current_sign
  attr_reader :name, :score
  attr_writer :current_game

  def initialize(name)
    @name = name
    @games = []
    @score = 0
  end

  def make_move()

    raise NoRunningGameError, "#{@name} does not play any game, currently." if @current_game == nil;
      
    puts "#{@name} please enter a position to make your choice."

    begin
      puts "Enter a number>>"
      num = Kernel.gets.match(/\d+/)[0]
    rescue
      puts "Erroneous input! Try again..."
      retry
    else  
      @current_game.set_field(num.to_i, @current_sign)
    end  

  end
end

class PositionAlreadySetError < ArgumentError  
end

class PositionToHighError < ArgumentError  
end

class NoRunningGameError < StandardError  
end

hendrik = Player.new("Hendrik")
theresa = Player.new("Theresa")

players = [hendrik, theresa]

game = Game.new()
game.add_players(players)
game.start()


# TODO
# Konfiguration der Player und Rundenzahl
# Computer Player
# Man könnte das Sign des Players beim initialisieren setzten, dann braucht man keine accessor rechte
# Müsste man diskutieren