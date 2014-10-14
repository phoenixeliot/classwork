class Tree
  def initialize value = nil
    @root = Node.new value, nil
  end
  
  def root
    @root
  end
  
  class Node
    attr_accessor :parent, :children, :value
    
    def initialize value, parent=nil
      @value = value
      @children = []
      @parent = parent
    end
  end
end