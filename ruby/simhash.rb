# http://matpalm.com/resemblance/simhash/

class String

  def shingles
    self.split(//).each_cons(2).inject([]) { |a, c| a << c.join }.uniq
  end

  def simhash
    v = Array.new(64) { 0 }
    hashes = shingles.map(&:hash)
    hashes.each do |hash|
      hash.to_s(2).split(//).each_with_index do |bit, i|
        bit.to_i & 1 == 1 ? v[i] += 1 : v[i] -= 1
      end
    end
    v.map{ |i| i >= 0 ? 1 : 0 }.join
  end

  def hamming_distance(other)
    other_sh = other.simhash
    self.simhash.split(//).each_with_index.inject(0) do |total, (bit, i)|
      total += 1 if bit == other_sh[i]
      total
    end
  end

end
