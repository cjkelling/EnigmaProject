class Key
  attr_reader :num, :a_key, :b_key, :c_key, :d_key

  def initialize(key = 0)
    @key = key
    @num = []
  end

  def random_number
    5.times { @num << rand(0..9) }
    @num
  end

  def assign_values
    if @key == 0
      @a_key = (@num[0..1]).join
      @b_key = (@num[1..2]).join
      @c_key = (@num[2..3]).join
      @d_key = (@num[3..4]).join
    else
      @a_key = (@key[0..1])
      @b_key = (@key[1..2])
      @c_key = (@key[2..3])
      @d_key = (@key[3..4])
    end
  end
end
