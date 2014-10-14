class Integer
  def deep_dup
    self
  end
end

class Array
  def deep_dup
    res = []
    self.each do |el|
      res << el.deep_dup
    end
    res 
  end
end


