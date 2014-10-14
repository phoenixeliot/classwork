require 'debugger'

def make_change num, coins
  coins = coins.sort.reverse
  return [] if num == 0
  count = num/coins[0]
  [coins[0]] * count + make_change(num % coins[0], coins[1..-1])
end

def make_change num, coins
  coins = coins.sort.reverse
  return [] if num == 0
  count = num / coins[0]
  if count >= 1
    [coins[0]] + make_change(num - coins[0], coins)
  else                                            
    make_change(num, coins[1..-1])
  end
end

american = [1, 5, 10, 25, 50, 100].reverse



def make_change num, coins
  return [] if num == 0
  res = []
  (0...coins.length).each do |i|
    if num < coins[i]
      next
    end
    res << [coins[i]] + make_change(num - coins[i], coins[i..-1])
  end
  res.min_by do |option|
    option.length
  end
end

p make_change(14, [10, 7, 1])
