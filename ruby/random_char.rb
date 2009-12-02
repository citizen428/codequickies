def get_random_char
  (r = rand(36)) < 26 ? (?a+r).chr : (?0+r-26).chr
end

# rand(36).to_s(36)
