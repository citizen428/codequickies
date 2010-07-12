=begin
  After a discussion with Victor Goff in this Gist:
  https://gist.github.com/7628cf7a4745c9179c66
=end

def build_hash_with_derivative_values(units, property)
  properties = (property.inject([1]) { |a,v| a << v*a[-1] })[1..-1] # This returns the elements at this range
  units.zip(properties).inject({}) { |h, (k,v)| h[k] = v ; h }
end

build_hash_with_derivative_values([:yard, :foot, :inch], [1, 3, 12]) 
# => {:yard=>1, :foot=>3, :inch=>36}
build_hash_with_derivative_values([:year, :day, :hour, :minute, :second], [1, 365, 24, 60, 60]) 
# => {:year=>1, :day=>365, :hour=>8760, :minute=>525600, :second=>31536000}

# Just a slight variation of the above, that saves you from always having 
# to pass in 1 as the first value of property:
def build_hash_with_derivative_values(units, property)
  properties = property.inject([1]) { |a,v| a << v*a[-1] }
  units.zip(properties).inject({}) { |h, (k,v)| h[k] = v ; h }
end

# maybe :yard and :year shouldn't be part of the hash at all
def build_hash_with_derivative_values(units, property)
  properties = property.inject([1]) { |a,v| a << v*a[-1] }
  units.zip(properties[1..-1]).inject({}) { |h, (k,v)| h[k] = v ; h }
end


