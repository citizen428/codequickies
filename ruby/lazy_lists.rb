class LazyList
  def initialize(&block)
    @ll = Hash.new &block 
  end
  
  def take(x)
    (1..x).inject([]) { |ret, i| ret << @ll[i]}
  end
  
  def take_from(x,y=1)
    (0..y-1).inject([]) { |ret, i| ret << @ll[x+i]}
  end
  
  def take_while(operand, value)
    ret = []
    i = 1
    loop do 
      x = take_from(i)[0]
      break if !x.send(operand, value)
      ret << x
      i += 1
    end
    ret
  end
  
  def [](x)
    @ll[x]
  end
end
 
multiples_of_three = LazyList.new { |h, k| h[k] = k*3 }
multiples_of_three.take(3) # => [3, 6, 9]
multiples_of_three[6] # => 18
 
even_nums = LazyList.new { |h, k| h[k] = k * 2 }
even_nums.take(10) # => [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
even_nums.take_while(:<, 18) # => [2, 4, 6, 8, 10, 12, 14, 16]
 
squares = LazyList.new { |h,k| h[k] = k*k }
squares.take(5) # => [1, 4, 9, 16, 25]
squares[12] # => 144
squares.take_from(5, 10) # => [25, 36, 49, 64, 81, 100, 121, 144, 169, 196]