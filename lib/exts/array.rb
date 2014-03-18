class Array
  def contains_any?(arr)
    arr.each do |el|
      return true if self.include?(el.to_sym) || self.include?(el.to_s)
    end
    false
  end

  def avg
    (self.inject(0.0) { |sum, el| sum + el } / size).round(2)
  end

  def random
    if size > 0
      self[rand(size)]
    end
  end
end
