class Game
  def initialize
    @computer_code = Code.random    
  end
  
  def play limit=10
    p @computer_code.secret
    
    limit.times do
      print "Enter a code (4xROYGBP): "
      input = gets.chomp
      user_code = Code.from_string(input)
      if won? user_code
        puts "You win!"
        return
      else
        display_matches user_code
      end
    end
    puts "You ran out of moves!"
  end
  
  def display_matches user_code
    exact = @computer_code.exact_matches(user_code)
    near = @computer_code.near_matches(user_code)
    puts "Incorrect. Exact matches: #{exact} Near matches: #{near}"    
  end
  
  def won? user_code
    @computer_code.exact_matches(user_code) == 4
  end  
end

class Code
  attr_accessor :secret
  COLORS = %w[R O Y G B P]
  
  def initialize secret
    self.secret = secret
  end
  
  def self.from_string string
    parsed = self.parse(string)
    self.new parsed
  end
  
  def self.random
    self.new COLORS.sample(4)
  end
  
  def self.parse input
    #tell them if they have bad input
    input.upcase.scan(/[ROYGBP]/)
  end
  
  def exact_matches other_code
    matches = 0
    4.times do |i|
      matches += 1 if @secret[i] == other_code[i]
    end
    matches
  end
  
  def all_matches_color other_code, other_color
    count1 = @secret.count(other_color)
    count2 = other_code.count(other_color)
    # puts "#{count1}, #{count2}, #{other_color}"
    [count1, count2].min
  end

  def near_matches other_code
    all_matches = 0
    uniq_code = Code.new(other_code.secret.uniq)
    uniq_code.each do |other_color|
      all_matches += all_matches_color(uniq_code, other_color)
    end
    all_matches - exact_matches(other_code)
  end
  
  def [] index
    @secret[index]
  end
  
  def each
    @secret.each do |i|
      yield i
    end
  end
  
  def count arg=nil
    @secret.count arg
  end
  
end

game = Game.new
game.play