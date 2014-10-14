def stock_picker values
  best_value = 0
  best_pair = [0,0]
  
  (0...values.length).each do |i|
    (i...values.length).each do |j|
      val = values[j]-values[i]
      if val > best_value
        best_value = val
        best_pair = [i,j]
      end
    end
  end
  
  best_pair
end