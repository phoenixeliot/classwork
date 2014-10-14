class Array
  def my_each &proc
    for i in 0...self.length
      proc.call self[i]
    end
    self
  end
  
  def median
    sorted = self.sort
    length = self.length - 1
    if self.length.even?
      median = (sorted[length/2] + sorted[length/2 + 1]) / 2.0
    else
      median = sorted[length/2]
    end
    
    median
  end
  
end




p [1,2,3,4,5].median