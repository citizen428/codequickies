class Proc
  def prim_call(stack)
    forth_arity = self.arity - 1
    if stack.size < forth_arity
      puts "Buffer underrun"
      stack.clear
      return
    end
    forth_arity > 0 ? self.call(stack, *stack.pop(forth_arity)) : self.call(stack)
  end
end

stack = []
dictionary = {}
primitives = {
  ":"          => lambda { |stack, s| dictionary[s[1]] = s[2..-2] },
  "+"          => lambda { |stack, x, y| stack << (x + y) },
  "-"          => lambda { |stack, x, y| stack << (x - y) },
  "*"          => lambda { |stack, x, y| stack << (x * y) },
  "/"          => lambda { |stack, x, y| stack << (x / y) },
  "."          => lambda { |stack, x| puts "#{x} " },
  "dup"        => lambda { |stack| stack << stack.last },
  "rot"        => lambda { |stack| (stack << stack.pop(2).reverse).flatten! },
  "clearstack" => lambda { |stack| stack.clear },
  ".S"         => lambda { |stack| puts "<#{stack.size}> #{stack.join(' ')} " },
}

parse = lambda do |s, main=true|
  tokens = s.split
  return primitives[":"].call(stack, tokens) if tokens.first == ":"
  tokens.each do |token|
    if primitives.has_key?(token)
      primitives[token].prim_call(stack)
    elsif dictionary.has_key?(token)
      dictionary[token].map { |t| parse.call(t, false) }
    else
      begin
        stack << Integer(token)
      rescue ArgumentError
        puts "Undefined word <<<#{token}>>>"
        stack = []
      end
    end
  end
  puts "  ok" if main
end

puts <<EOF
NotReallyFORTH 0.1
Type 'bye' to exit
EOF
until (s = gets.chomp) == 'bye'
  exit unless s
  parse.call(s)
end
