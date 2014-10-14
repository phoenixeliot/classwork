def caesar text, shift_amount
  alphabet = ('a'..'z').to_a
  letters = text.scan(/./)
  
  cypher_text = ""
  
  letters.each do |l|
    if alphabet.include? l
      new_index = (alphabet.index(l) + shift_amount)%26
      cypher_text << alphabet[new_index]
    else
      cypher_text << l
    end
  end
  
  cypher_text
end

p caesar("hello world", 3)