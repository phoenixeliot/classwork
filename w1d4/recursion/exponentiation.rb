def exp(base, power)
  return 1 if power == 0
  if power.even?
    temp = exp(base, power/2)
    temp * temp
  else
    temp = exp(base, power/2)
    temp * temp * base
  end    
end


def dumb_exp(base, power)
  return 1 if power == 0
  return base * dumb_exp(base, power - 1)
end

p exp(2, 5)
