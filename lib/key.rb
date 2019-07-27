class Key
  attr_reader :num, :keys, :a_key, :b_key, :c_key, :d_key

  def initialize(keys = 0)
    @keys = keys
    @num = []
  end

  def random_number
    5.times { @num << rand(0..9) }
    @num
  end

  def assign_values
    if @keys == 0
      @a_key = (@num[0..1]).join
      @b_key = (@num[1..2]).join
      @c_key = (@num[2..3]).join
      @d_key = (@num[3..4]).join
    else
      @a_key = (@keys[0..1])
      @b_key = (@keys[1..2])
      @c_key = (@keys[2..3])
      @d_key = (@keys[3..4])
    end
  end
end
