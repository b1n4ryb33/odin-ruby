require 'json'

class Game

  def initialize (config)
    @guess_word = config.fetch("guess_word", "random")
    @guessed_characters = config.fetch("guessed_characters", [])
    @max_tries = config.fetch("max_tries", 10)
    @tries = config.fetch("tries", 0)
    print_to_console
  end

  attr_reader :guess_word, :guessed_characters, :max_tries, :tries
  
  def guess(character)
    char_lower = character.downcase
    @guessed_characters.push(char_lower) if !@guessed_characters.include?(char_lower)
    @tries = @tries + 1
  end

  def print_to_console()
    puts "\n"
    puts "Used Characters: #{@guessed_characters.join}"
    puts "\n"
    (0..@max_tries).each do |i|
      print "x" if i < @tries
      print "-" if i >= @tries
    end
    
    puts "\n\nword: \n"
    @guess_word.chars.each do |char|
      print char if @guessed_characters.include?(char)
      print '_' if @guessed_characters.include?(char) == false
    end
    puts "\n\n"
  end

  def game_over()
    return :won if won?
    return :loose if loose?
    false
  end

  def self.from_json(path)
    data = JSON.load File.read(path)
    self.new(data)
  end

  def save_game()
    Dir.mkdir('output') unless Dir.exists?('output')
    filename = "output/hangman.json"
    File.open(filename, 'w') do |file|
      file.puts self.to_json
    end
  end

  private

  def won?
    return true if @tries <= @max_tries && @guess_word.chars.all?{|char| @guessed_characters.include?(char)}
    false
  end

  def loose?
    return true if @tries == @max_tries && @guess_word.chars.any?{|char| @guessed_characters.include?(char) == false}
    false
  end

  def to_json
    JSON.dump ({
      :guess_word => @guess_word,
      :guessed_characters => @guessed_characters,
      :max_tries => @max_tries,
      :tries => @tries
    })
  end
  
end