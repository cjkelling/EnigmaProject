require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shift'
require './lib/key'
require './lib/offset'

class ShiftTest < Minitest::Test
  def setup
    @shift = Shift.new
    @key = Key.new
    @offset = Offset.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_shift
    @key.random_number
    @key.assign_values
    @offset.date_squared
    @offset.last_four
    @offset.assign_offset_values

    @shift.shift(
      @key.a_key, @offset.a_offset, @key.b_key, @offset.b_offset,
      @key.c_key, @offset.c_offset, @key.d_key, @offset.d_offset
    )

    assert @shift.a_shift.is_a? Numeric
    assert @shift.b_shift.is_a? Numeric
    assert @shift.c_shift.is_a? Numeric
    assert @shift.d_shift.is_a? Numeric
  end
end
