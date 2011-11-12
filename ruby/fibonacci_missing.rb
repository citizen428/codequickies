class Fibonacci
  @fibs = Hash.new { |h,k| h[k] = h[k-1] + h[k-2] }
  @fibs.merge!({ 0 => 0, 1 => 1 })

  def self.respond_to?(m)
    !!(m =~ /f_\d+/)
  end

  def self.method_missing(m, *args, &block)
    if m =~ /f_(\d+)/
      return @fibs[Integer($1)]
    end
    super
  end
end

=begin
doctest: Fibonacci responds to well formed methods
>> Fibonacci.respond_to? :f_5
=> true
doctest: Fibonacci doesn't respond to malformed methods
>> Fibonacci.respond_to? :f_a
=> false
doctest: Fibonacci calculates the correct values
>> Fibonacci.f_5
=> 5
>> Fibonacci.f_10
=> 55
=end
