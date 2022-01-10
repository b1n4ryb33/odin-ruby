def caesar_cipher(word, shift)
  n = 26 # letters amount
  
  if shift < 0
    return caesar_cipher(word, shift + n)
  end

cipher = word.split(//).map do |char|

    if char.match?(/[a-z]/i)
      code = char.ord
      shift_base = code >= 65 && code <= 90 ? 65 : code >= 97 && code <= 122 ? 97 : 0
      (((code - shift_base + shift) % n) + shift_base).chr
    else
      char
    end
   
  end
  cipher.join('')
end

puts caesar_cipher('A', 1) #B
puts caesar_cipher('Aaa', 1) #Bbb
puts caesar_cipher('Hello, World!', 5) # 'Mjqqt, Btwqi!'
puts caesar_cipher('Mjqqt, Btwqi!', -5) # 'Hello, World!'
puts caesar_cipher('Z', 1) # A
puts caesar_cipher('Hello, World!', 75) # 'Ebiil, Tloia!'
puts caesar_cipher('Hello, World!', -29) # 'Ebiil, Tloia!'