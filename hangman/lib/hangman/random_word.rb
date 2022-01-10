module RandomWord
  
  @@words = File.readlines('resources/5desk.txt')

  def RandomWord.get_random
    @@words[Random.new.rand(0..@@words.length-1)].chomp
  end

end