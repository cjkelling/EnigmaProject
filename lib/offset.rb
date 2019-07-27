require 'date'

class Offset
  attr_reader :date, :a_offset, :b_offset, :c_offset, :d_offset

  def initialize(date = 0)
    @date = date
    @date = Time.now.strftime('%m/%d/%Y').delete('/').to_i if @date == 0
  end

  def date_squared
    @squared = (@date.to_i * @date.to_i)
  end

  def last_four
    @square = @squared.digits.slice(0..3).reverse
  end

  def assign_offset_values
    @a_offset = @square[0].to_s
    @b_offset = @square[1].to_s
    @c_offset = @square[2].to_s
    @d_offset = @square[3].to_s
  end
end
