def merge_sort arr
  return arr if arr.length <= 1
  middle = arr.length / 2  
  
  left = merge_sort(arr[0...middle])
  right = merge_sort(arr[middle..-1])
  merge(left, right)
end

def merge arr1, arr2
  res = []
  until arr1.empty? || arr2.empty?
    if arr1.first <= arr2.first
      res << arr1.shift
    else 
      res << arr2.shift
    end
  end
  res + arr1 + arr2
end
