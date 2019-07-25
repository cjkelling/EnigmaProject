require 'date'

class Offset
  attr_reader :date, :a_key_offset, :b_key_offset, :c_key_offset, :d_key_offset

  def initialize
    @date = Time.now.strftime("%m/%d/%Y").delete("/").to_i
    @a_key_offset = []
    @b_key_offset = []
    @c_key_offset = []
    @d_key_offset = []
    @squared = 0
  end

  def date_squared
    @squared += (@date * @date)
  end

  def last_four
    @squared
  end
end
# last 4 digits
# equates to a b c d
