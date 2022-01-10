require_relative "./../lib/tic_tac_toe.rb"
 
puts "Welcome to tic tac toe"
bob = TicTacToe::Player.new({sign: "X", name: "bob"})
frank = TicTacToe::Player.new({sign: "O", name: "frank"})
players = [bob, frank]
TicTacToe::Game.new(players).play