require_relative "./../lib/tic_tac_toe.rb"
 
# puts "Welcome to tic tac toe"
# bob = TicTacToe::Player.new({symbol: "X", name: "bob"})
# frank = TicTacToe::Player.new({symbol: "O", name: "frank"})
# players = [bob, frank]
# TicTacToe::Game.new(players).play
TicTacToe::new_game()
TicTacToe::show_all_games()
