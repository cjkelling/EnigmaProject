require 'date'

class Offset
  attr_reader :date, :a_offset, :b_offset, :c_offset, :d_offset

  def initialize(date = 0)
    @date = date
    if @date.zero?
      @date = Time.now.strftime('%m/%d/%Y').delete('/').to_i
    end
  end

  def date_squared
    @squared = (@date * @date)
  end

  def last_four
    @square = @squared.digits.slice(0..3).reverse
  end

  def assign_offset_values
    @a_offset = @square[0]
    @b_offset = @square[1]
    @c_offset = @square[2]
    @d_offset = @square[3]
  end
end
