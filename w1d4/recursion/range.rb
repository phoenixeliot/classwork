def range start, stop
  return [] if stop < start
  return [start] if stop == start
  [start] + range(start+1, stop)
end

p range(2,5)
p range(2,2)
p range(2,0)

def range_iter start, stop
  res = []
  i = start
  until i > stop
    res << i
    i += 1
  end
  res
end

p range_iter(2,5)
p range_iter(2,2)
p range_iter(2,0)