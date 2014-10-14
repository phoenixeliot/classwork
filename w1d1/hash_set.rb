class MyHashSet
  def initialize
    @store = Hash.new(false)
  end
  
  def insert(el)
    @store[el] = true
  end
  
  def include?(el)
    @store[el]
  end
  
  def delete(el)
    return @store.delete(el)
  end
  
  def to_a
    @store.keys
  end
  
  def union(set2)
    result = MyHashSet.new
    
    self.to_a.each do |el|
      result.insert(el)
    end
    
    set2.to_a.each do |el|
      result.insert(el)
    end
    
    result
  end
  
  def intersect(set2)
    result = MyHashSet.new
    
    self.to_a.each do |el|
      result.insert(el) if set2.include?(el)
    end
    result
  end
  
  def minus(set2)
    result = MyHashSet.new
    
    self.to_a.each do |el|
      result.insert(el) unless set2.include?(el)
    end
    
    result
  end
  
  def to_s
    self.to_a.to_s
  end
end


a = MyHashSet.new
b = MyHashSet.new
a.insert 2
a.insert 3

b.insert 1
b.insert 2

p a.intersect b
p a.union b
p a.minus b