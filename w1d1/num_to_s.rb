def num_to_s num,base
  chars = "0123456789ABCDEF".scan(/./)
  
  digits = 1.upto(Math.log(num,base).ceil).map do |i|
    (num % base ** i) / (base ** (i - 1))
  end.reverse
  
  digits.map { |i| chars[i] }.join
  
end

p num_to_s(5, 10) #=> "5"
p num_to_s(5, 2)  #=> "101"
p num_to_s(5, 16) #=> "5"

p num_to_s(234, 10) #=> "234"
p num_to_s(234, 2)  #=> "11101010"
p num_to_s(234, 16) #=> "EA"