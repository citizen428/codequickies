# http://en.wikipedia.org/wiki/Luhn_algorithm
def credit_card_valid?(account_number)
  digits = account_number.chars.map(&:to_i)
  check = digits.pop

  sum = digits.reverse.each_slice(2).map do |x, y|
    [(x*2).divmod(10), y]
  end.flatten.inject(:+)

  (10 - sum % 10) == check
end

p credit_card_valid? "79927398713" #=> true
p credit_card_valid? "79927398714" #=> false
