class Hangman
  def initialize guessing_player, checking_player, turn_limit
    @guessing_player = guessing_player
    @checking_player = checking_player
    @turn_limit = turn_limit
  end
  
  def play
    initial_setup
    @turn_limit.times do
      display
      # puts "Secret word is '#{@checking_player.secret_word}'"
      guess = @guessing_player.guess
      indexes = @checking_player.check_guess(guess)
      update_state indexes, guess
      @guessing_player.handle_guess_response indexes, guess, @game_state
      break if won?
    end
    display
    if won?
      puts "Guesser won!"
    else
      puts "Non-guesser won!"
    end
  end
  
  def initial_setup
    @word_length = @checking_player.pick_secret_word
    @guessing_player.receive_secret_length @word_length
    @game_state = Array.new(@word_length, nil)
  end
  
  def won?
    @game_state.none? { |i| i.nil? }
  end
  
  def display
    puts @game_state.map{ |l| l.nil? ? '_' : l }.join
  end
  
  def update_state indexes, guess
    if indexes
      indexes.each do |i|
        @game_state[i] = guess
      end
    else
      puts "Sorry! That letter '#{guess}' wasn't in the word."
    end
  end
end

class HumanPlayer
  def initialize
  end
  
  def guess
    print "Guess a letter: "
    gets[0]
  end
  
  def pick_secret_word
    print "Choose a word and tell us how long it is: "
    Integer(gets)
  end
  
  def check_guess letter
    print "What positions have this letter '#{letter}', or just press enter? "
    indexes = gets.scan(/[0-9]+/).map(&:to_i)
    return false if indexes.empty?
    indexes
  end
  
  def receive_secret_length
  end
end

class ComputerPlayer
  # attr_reader :secret_word
  
  def initialize filename
    @letters_left = ('a'..'z').to_a
    @dictionary = File.readlines(filename).map(&:chomp)
    @word_list = @dictionary.dup
  end
  
  def pick_secret_word
    @secret_word = @dictionary.sample
    @secret_word.length
  end
  
  def check_guess letter
    if @secret_word.include? letter
      chars = @secret_word.chars.to_a
      chars.each_index.select { |i| chars[i] == letter }
    else
      false
    end
  end
  
  def handle_guess_response response, guess, state
    if !response
      @word_list = filter_by_bad_guess @word_list, guess
    else
      @word_list = filter_by_state @word_list, state
    end
  end
  
  def guess
    # puts "Words left: #{@word_list.length}"
    # p @word_list[0..10]
    letter = most_common_letter(create_hash(@word_list))
    @letters_left.delete(letter)
  end
  
  def receive_secret_length length
    @secret_length = length
    @word_list = filter_by_length @word_list, length
  end
  
  def create_hash word_list
    letter_frequency = Hash.new(0)
    word_list.each do |word|
      word.chars.to_a.uniq.each do |letter|
        letter_frequency[letter] += 1 if @letters_left.include? letter
      end
    end
    letter_frequency
  end
  
  def most_common_letter letter_frequency
    letter_frequency.max_by { |k, v| v }.first
  end
  
  def filter_by_bad_guess word_list, letter
    word_list.reject do |word|
      word.include? letter
    end
  end
  
  def filter_by_length word_list, length
    word_list.select do |word|
      word.length == length
    end
  end
  
  def filter_by_state word_list, state
    word_list.reject do |word|
      (0...word.length).any? do |i|
        state[i] && (word[i] != state[i])
      end
    end
  end
end

# game = Hangman.new(HumanPlayer.new, ComputerPlayer.new("dictionary.txt"))
# game = Hangman.new(ComputerPlayer.new("dictionary.txt"), HumanPlayer.new)
game = Hangman.new(ComputerPlayer.new("dictionary.txt"),
                   ComputerPlayer.new("dictionary.txt"), 15)
game.play

def 