class MazeSolver
  attr_reader :start, :end, :maze
  
  def initialize filename
    @maze = File.read(filename).each_line.map do |line|
      line.scan(/./)
    end
    @maze.each_with_index do |row, row_ind|
      if row.include? 'S'
        @start = [row_ind, row.index('S')]
      end
      if row.include? 'E'
        @end = [row_ind, row.index('E')]
      end
    end
  end
  
  def solve
    
  end
end

# ms = MazeSolver.new('maze1.txt')
# p ms.maze
# p ms.start
# p ms.end