def my_transpose(array)
  old_rows = array.length
  old_cols = array[0].length
  
  new_rows = old_cols
  new_cols = old_rows
  
  result = Array.new(new_rows) { Array.new(new_cols) }
  
  array.each_with_index do |row, i|
    row.each_with_index do |element, j|
      result[j][i] = element
    end
  end
  
  result
end

p my_transpose([
    [0, 1, 2],
    [3, 4, 5],
  #  [6, 7, 8]
  ])
  
p my_transpose [[1]]