def sum arr
  return 0 if arr.empty?
  arr.last + sum(arr[0...-1])
end

def sum_iter arr
  res = 0
  i = 0
  while i < arr.length
    res += arr[i]
    i += 1
  end 
  res 
end   

p sum_iter [1,2,3]
p sum_iter []
