class Key
  attr_reader :num, :a_key, :b_key, :c_key, :d_key

  def initialize
    @num = []
    @a_key = []
    @b_key = []
    @c_key = []
    @d_key = []
  end

  def random_number
    5.times { @num << rand(0..9) }
  end

  def assign_values
    @a_key.push(@num[0], @num[1]).join.to_i
    @b_key.push(@num[1], @num[2]).join.to_i
    @c_key.push(@num[2], @num[3]).join.to_i
    @d_key.push(@num[3], @num[4]).join.to_i
  end
end
