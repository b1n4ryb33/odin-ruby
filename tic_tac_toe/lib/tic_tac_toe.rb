require_relative "tic_tac_toe/version"
require_relative "tic_tac_toe/player"
require_relative "tic_tac_toe/exceptions"
require_relative "tic_tac_toe/core_extensions"
require_relative "tic_tac_toe/board"
require_relative "tic_tac_toe/cell"
require_relative "tic_tac_toe/game"

module TicTacToe

  class Error < StandardError; end

  def TicTacToe.new_game(players="")

    players = game_set_up if players == ""
    Game.new(players).play
    replay(players)
    
  end

  def TicTacToe.show_all_games()
    puts Game.games
  end

  private

  def TicTacToe.game_set_up
    puts "Welcome to tic tac toe!"
    first_player = create_player(1)
    second_player = create_player(2)
    [first_player, second_player]
  end

  def TicTacToe.create_player(number)
    puts "Please enter a name for player #{number}"
    name = gets.chomp 
    symbol = number == 1 ? "X" : "O"
    Player.new(name: name, symbol: symbol)
  end

  def TicTacToe.replay(players)
    puts "Would you like to play a new game? Press 'y' for yes or 'n' for no."
    repeat_input = gets.chomp.downcase
    if repeat_input == 'y'
      new_game(players)
    else
      puts 'Thanks for playing!'
    end
  end

end
