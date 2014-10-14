class Fixnum
  def in_words recursed=false
    if !recursed and self==0
      return "zero"
    end
    
    ones = %w[zero one two three four five six seven eight nine]
    tens = %w[zero ten twenty thirty forty fifty sixty seventy eighty ninety]
    teens = %w[ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]
    powers = %w[one thousand million billion trillion]
    
    4.downto(1) do |i|
      power = i*3
      if self >= 10**(power)
        return ((self / 10**(power)).in_words(true) + " #{powers[i]} " + (self % 10**(power)).in_words(true)).chomp(' ')
      end
    end
    if self >= 100
      ((self / 100).in_words(true) + " hundred " + (self % 100).in_words(true)).chomp(' ')
    elsif self >= 20
      (tens[(self / 10)] + " " + (self%10).in_words(true)).chomp(' ')
    elsif (10..19).include? self
      teens[self-10]
    elsif self > 0
      ones[self]
    else
      ""
    end
  end
end

#p 12345.in_words
p 1_234_567_890_123.in_words
