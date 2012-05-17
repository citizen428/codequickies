class Array
  def zip_with(other, op=nil)
    return [] if self.empty? || other.empty?
    clipped = self[0..other.length-1]
    zipped = clipped.zip(other)

    if op
      zipped.map { |a, b| a.send(op, b) }
    else
      zipped.map { |a, b| yield(a, b) }
    end
  end
end
