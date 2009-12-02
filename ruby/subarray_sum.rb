def max_sum(array)
  best = current = 0
 
  array.each do |num|
    current += num
    current = 0 if current < 0
    best = current if current > best
  end
  best
end
 
[[-10, 8, -10, -12, -10], [-2, 1, -3, 4, -1, 2, 1, -5, 4], [-1, 2, 4, 28, -30, 50, 60, 80], [-1, -3, -4]].each do |array|
  puts max_sum(array)
end