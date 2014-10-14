class Array
  def two_sum
    
    results = []
    
    self.each_with_index do |element, i|
      # (i + 1...self.length).each do |j|
      self.each_with_index do |el2, i2|
        next unless i2 > i1
        element2 = self[j]
        
        if element + element2 == 0
          results << [i,j]
        end
      end
    end
    
    
    results.sort! do |a,b|  
      if a[0] < b[0]
        -1
      elsif a[1] < b[1]
        -1
      else
        1
      end
    end
  
    results
  end
end


p [-1, 0, 2, -2, 1].two_sum