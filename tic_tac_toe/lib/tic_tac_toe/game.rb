module TicTacToe

  class Game

    @@games = Array.new()

    attr_reader :players, :board, :active_player, :waiting_player
    
    def initialize(players, board = Board.new)
      @id = @@games.size + 1
      @players = players
      @board = board
      @active_player, @waiting_player = players.shuffle
    end

    def switch_players
      @active_player, @waiting_player = @waiting_player, @active_player
    end

    def game_over_message
      return "#{active_player.name} won!" if board.game_over == :winner
      return "The game ended in a tie" if board.game_over == :draw
    end

    def play
      puts "#{active_player.name} has randomly been selected as the first player"
      while true
        board.formatted_grid
        puts ""
        begin 
          x, y = active_player.choose_field
          board.set_cell(x, y, active_player.symbol)
        rescue PositionAlreadySetError => exception
          puts exception.message
          retry
        end
        if board.game_over
          safe_results
          puts game_over_message
          board.formatted_grid
          return
        else
          switch_players
        end
      end
    end

    def Game.games
      @@games
    end

    private

    def safe_results

      @@games.push(game_result)

      players.each do |player|
        player.games.push(game_result)
      end

    end

    def game_result
      {
        gameId: @id,
        players: @players.map {|player| [player.name, player.symbol]},
        winner: @board.game_over == :winner ? @active_player.name : "",
        draw: @board.game_over == :draw ? true : false,
        board: @board.get_grid
      }
    end

  end

end