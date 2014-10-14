def bsearch(array, target)
  return nil if array.empty?       
  # return 0 if array[0] == target    
  split_index = array.length / 2
                        
  if target == array[split_index]
    return split_index 
  elsif target < array[split_index]
    bsearch(array[0...split_index], target)
  else
    maybe_index = bsearch(array[split_index + 1..-1], target)
    return nil unless maybe_index
    maybe_index + split_index + 1
  end                  
end

p bsearch([1,2,3], 3)
p bsearch([1,2,3], 2)
p bsearch([1,2,3], 1)
p bsearch([1,2,3], 4)