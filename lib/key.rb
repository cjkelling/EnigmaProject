class Key
  attr_reader :num, :a_key, :b_key, :c_key, :d_key

  def initialize
    @num = []
  end

  def random_number
    5.times { @num << rand(0..9) }
    @num
  end

  def assign_values
    @a_key = (@num[0..1]).join.to_i
    @b_key = (@num[1..2]).join.to_i
    @c_key = (@num[2..3]).join.to_i
    @d_key = (@num[3..4]).join.to_i
  end
end
