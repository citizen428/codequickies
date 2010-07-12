=begin
  Consider this puzzle: By starting from the number 1 and repeatedly
  either adding 5 or multiplying by 3, an infinite amount of new numbers
  can be produced. How would you write a function that, given a number,
  tries to find a sequence of additions and multiplications that produce
  that number?
  
  Taken from Eloquent JavaScript by Marijn Haverbeke
=end

def find_sequence(goal)
 find = Proc.new do |start, history|
   if start == goal
     return history
   elsif (start < goal)
     find.call(start+5, "(#{history} + 5)") ||
     find.call(start*3, "(#{history} * 3)")
   else
     nil
   end
 end
 find.call(1, "1")
end

find_sequence(99) # => "((((1 + 5) + 5) * 3) * 3)"