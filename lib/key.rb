class Key
  attr_reader :num, :a_key, :b_key, :c_key, :d_key

  def initialize
    @num = 0
    @a_key = 0
    @b_key = 0
    @c_key = 0
    @d_key = 0
  end

  def random_number
    @num = rand(1..99_999)
  end
end
