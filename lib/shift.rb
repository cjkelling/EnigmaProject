class Shift
  attr_reader :character_set, :a_shift, :b_shift, :c_shift, :d_shift

  def set_a_shift(key, offset)
    @a_shift = (key + offset)
  end

  def set_b_shift(key, offset)
    @b_shift = (key + offset)
  end

  def set_c_shift(key, offset)
    @c_shift = (key + offset)
  end

  def set_d_shift(key, offset)
    @d_shift = (key + offset)
  end
end
