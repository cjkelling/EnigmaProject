require 'date'

class Offset
  attr_reader :date, :a_key_offset, :b_key_offset, :c_key_offset, :d_key_offset

  def initialize
    @date = Time.now.strftime("%m/%d/%Y").delete("/").to_i
  end

  def date_squared
    @squared = (@date * @date)
  end

  def last_four
    @square = @squared.digits.slice(0..3).reverse
  end

  def assign_offset_values
    @a_key_offset = @square[0]
    @b_key_offset = @square[1]
    @c_key_offset = @square[2]
    @d_key_offset = @square[3]
  end
end
