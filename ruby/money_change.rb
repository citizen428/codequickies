class Fixnum
  def to_money(denominations)
    res = []
    denominations.sort.reverse.inject(self) do |amount, denom| 
      res << [denom, amount/denom]
      amount % denom
    end
    res.reject { |denom, amount| amount.zero? }
  end
end

denoms = [1,2,5,10,20,50,100]

134.to_money(denoms) # => [[100, 1], [20, 1], [10, 1], [2, 2]]
134.to_money(denoms.shuffle) # => [[100, 1], [20, 1], [10, 1], [2, 2]]
99.to_money([1,2,5,10,50]) # => [[50, -2], [1, 1]]
