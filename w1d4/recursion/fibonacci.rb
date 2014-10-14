def fib_rec num
  return [0] if num == 0
  return [0, 1] if num == 1
  arr = fib_rec(num - 1)
  last = arr[-1] + arr[-2]
  arr << last
  arr
end

# p fib_rec 5

def fib_iter num
  res = [0, 1]
  (0...num).each do |i|
    res[i] ||= res[i-1] + res[i-2]
  end
  res[0...num]
end

p fib_iter 0
p fib_iter 1
p fib_iter 5
p fib_iter 10