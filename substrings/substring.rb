def substrings(sentence, dictionary)
  words = sentence.downcase.scan(/\w+/);
  dictionary.reduce(Hash.new(0)) do |words_in_dictionary, dictionary_word|
    words.each {|word_from_sentence| words_in_dictionary[dictionary_word] += 1 if word_from_sentence.include?(dictionary_word)}
    words_in_dictionary
  end
end

dictionary = ["below", "down", "go","going","horn","how", "howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
#{ "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }