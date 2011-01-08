def valid_isbn13?(isbn)
  nums = isbn.delete('-').gsub(/[xX]{1}$/,'').scan(/./).map(&:to_i)
  check = nums.pop
  sum = nums.each_slice(2).inject(0) { |s, (n,m)| s + n + m * 3 }  
  10 - sum % 10 == check
end

valid_isbn13? '9780552145428'  # => true
valid_isbn13? '9780552145438'  # => false
valid_isbn13? '978-1593272814' # => true
