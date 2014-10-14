class Array

  def my_uniq
  
    result = []
  
    self.each do |element|
      unless result.include?(element)
        result.push(element)
      end
    end
  
    result
  
  end

end

p [1,2,1,3,3].my_uniq
