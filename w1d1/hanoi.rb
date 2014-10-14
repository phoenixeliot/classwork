class HanoiGame
  def initialize(number_of_disks = 3)
    @starting_stack = (1..number_of_disks).to_a.reverse
    @stacks = [@starting_stack.clone,[],[]]
  end
  
  def get_input
    puts "From, To:"
    input = gets.scan(/[0-9]/).map(&:to_i)
  end

  def make_move a, b
    @stacks[b].push(@stacks[a].pop)
  end
  
  def check_and_make_move from, to
    if @stacks[from].empty? # or @stacks[from][-1] > @stacks[input[1]][-1]
      puts "Sorry, not a valid move"
    elsif @stacks[to].empty?
      make_move(from, to)
    elsif @stacks[to].last > @stacks[from].last
      make_move(from, to)
    else
      puts "Sorry, not a valid move"
    end
  end

  def run
    until game_over?
      p @stacks
      from, to = get_input
      check_and_make_move(from,to)
    end
  
    p @stacks
    puts "You won!"
  end

  def game_over?
    @stacks[1..-1].include?(@starting_stack)
  end
end

HanoiGame.new(2).run