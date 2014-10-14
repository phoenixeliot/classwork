class Array
  def my_each
    if block_given?
      self.length.times do |i|
        yield self[i]
      end
    end
    self
  end
  
  def my_map
    if block_given?
      arr = []
      self.my_each { |i| arr << (yield i) }
    arr
    end
  end
  
  def my_select
    if block_given?
      arr = []
      self.my_each do |item|
        if (yield item) 
          arr << item
        end
      end
    end
    arr    
  end
  
  def my_reduce(&proc)
    return nil if self.empty?
    memo = self.first
    self[1..-1].my_each do |item|
      memo = proc.call(memo, item)
    end
    memo
  end
  
  def sort
    self.dup.sort!
  end
  
  def my_sort!
    sorted = false
    until sorted
      sorted = true
      (0...self.length-1).each do |i|
        if swap(i,i+1)
          sorted = false
        end
      end
    end
    self
  end
  
  def swap i,j
    if self[i] > self[j]
      self[i], self[j] = self[j], self[i]
      return true
    end
    false
  end
end

p [1, 2, 3].my_each { |i| puts i }
p [1, 2, 3].my_map { |i| i * 2 }
p [1, 2, 3].my_select { |i| i.odd? }
p [1, 2, 3].my_reduce { |a, b| a + b } 

puts "All of these should be blank: "
[].my_each { |i| puts i}
p [].my_map { |i| i * 2 }
p [].my_select { |i| i.odd? }
puts "Should be nil: "
p [].my_reduce { |a, b| a + b } 

a = (0..9).to_a.shuffle
p a
a.sort!
p a