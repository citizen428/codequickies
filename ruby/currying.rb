multiplier = (-> x,y {x*y}).curry
times_two = multiplier[2]
times_two.call(5) # => 10

