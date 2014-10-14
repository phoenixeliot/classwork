def subsets array
  return [[]] if array.empty?
  
  results = [array]
  array.each_index do |i|
    results += subsets(array[0...i] + array[i+1..-1])
  end
  
  results.uniq
end

p subsets [1,2,3,4].shuffle