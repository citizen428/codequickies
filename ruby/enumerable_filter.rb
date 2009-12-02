module Enumerable 
  # operand can be a String or a Symbol
  def filter(operand, value)
    raise(ArgumentError, "Invalid operator") unless %w(> < >= <= ==).include?(operand.to_s)
    return self if self.class == String
    self.select { |el| el.send(operand, value) } 
  end
end  # example use
 
# using a String as operand
test = [1,5,3,2,1,6,4,3,2,1] 
test.filter('<', 5) # => [1, 3, 2, 1, 4, 3, 2, 1]
 
# using a Symbol as operand
quiz = [0,0,0,1,0,0,1,1,0,1]
attempted = quiz.filter(:==, 1) # => [1, 1, 1, 1]
 
# Passing and invalid argument
test.filter('lala', 0) # => 
# ~> -:4:in `filter': Invalid operator (ArgumentError)
# ~> 	from -:19