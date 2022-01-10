require_relative "hangman/version"
require_relative "hangman/game"
require_relative "hangman/random_word"

module Hangman

  class Error < StandardError; end

  def self.start
   
    self.intro_dialog

    if self.load_game?
      game = load_game
    else
      puts "Started a new game."
      game = Game.new({"guess_word" => RandomWord::get_random})
    end

    while true do
      puts "please make a guess or type save, to save the game and quit."
      char = Kernel.gets.chomp
      if char == "save"
        game.save_game()
        puts "saved the game and quit"
        return
      end
      game.guess(char)
      game.print_to_console
      if game.game_over
        puts "Game Over"
        puts "the word was #{game.guess_word}"
        return 
      end
    end
  end

  private
  def self.intro_dialog
    puts "Hangman initilaized..."
  end

  def self.load_game?
    self.console_yes_no("Do you want to load a existing game? (y/n)")
  end

  def self.load_game
    begin
      puts "Please provide a path to a saved game file."
      path = Kernel.gets.chomp
      game = Game.from_json(path)
      puts "loaded sucessfully"
      return game  
    rescue => exception
      puts exception
      puts "You can retry or abort the game with ctrl + c"
      retry
    end
  end

  def self.console_yes_no(question)
    puts question
    char = Kernel.gets.chomp
    return true if char == 'y'
    return false
  end
end

Hangman::start
