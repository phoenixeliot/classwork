require 'debugger'

class EightQueens
  EMPTY_BOARD = Array.new(8) { Array.new(8,0) }
  
  def initialize
    @size = 8
    @solutions = []
  end
  
  def solve board = EMPTY_BOARD, queens = 0
    if queens == 8
      if @solutions.include? board
        return
      else
        @solutions << board
        puts "Found a solution"
        display board
      end
      return
    end
    @size.times do |r|
      @size.times do |c|
        temp_board = deep_copy(board)
        if place_queen temp_board, [r, c]
          # display temp_board
          temp_board = update_board temp_board, [r, c]
          solve temp_board, queens + 1
        end
      end
    end
  end
  
  def place_queen board, pos
    r, c = pos
    if valid_pos? board, pos
      board[r][c] = 1
      true
    else
      false
    end
  end
  
  def deep_copy board
    board.map(&:dup)
  end
  
  def update_board board, pos
    new_board = deep_copy board
    r, c = pos
    directions = [[0, 1], [0, -1], [1, 0], [-1, 0],
                  [1, 1], [1, -1], [-1, -1], [-1, 1]]
    directions.each do |dir|
      (1..@size).each do |i|
        r_dir, c_dir = dir
        new_pos = [r + r_dir * i, c + c_dir * i]
        if on_board? new_pos
          new_board[new_pos[0]][new_pos[1]] = -1
        else
          break
        end
      end
    end
    return new_board
  end
  
  def valid_pos? board, pos
    r, c = pos
    return false unless on_board? pos
    return false unless (board[r][c] == 0)
    true
  end
  
  def on_board? pos
    r, c = pos
    (0...@size).include?(r) && (0...@size).include?(c)
  end
  
  def display board
    board.each do |row|
      print row.map { |num|
        case num
        when -1
          "."
        when 0
          " "
        when 1
          "Q"
        end
      }.to_a.join(" | ")
      puts
    end
    puts
  end
end

# almost_solved =
# [[-1, -1, -1, -1, -1,  1, -1, -1],
#  [-1, -1, -1,  1, -1, -1, -1, -1],
#  [-1, -1, -1, -1, -1, -1,  1, -1],
#  [ 1, -1, -1, -1, -1, -1, -1, -1],
#  [-1, -1, -1, -1, -1, -1, -1,  1],
#  [-1,  0, -1, -1, -1, -1, -1, -1],
#  [-1, -1, -1, -1,  1, -1, -1, -1],
#  [-1, -1,  0, -1, -1, -1, -1, -1]]

game = EightQueens.new
#
# board = [[0]*8]*8
#
# place_queen(board, [])


# game.solve almost_solved, 6

game.solve