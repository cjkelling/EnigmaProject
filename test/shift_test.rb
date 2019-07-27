require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shift'
require './lib/key'
require './lib/offset'

class ShiftTest < Minitest::Test
  def setup
    @key = Key.new('02693')
    @offset = Offset.new('110588')
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_shift
    @key.assign_values
    @offset.date_squared
    @offset.last_four
    @offset.assign_offset_values
    @shift.shift(
      @key.a_key, @offset.a_offset, @key.b_key, @offset.b_offset,
      @key.c_key, @offset.c_offset, @key.d_key, @offset.d_offset
    )
    assert_equal '07', "%02d"% @shift.a_shift
    assert_equal '33', "%02d"% @shift.b_shift
    assert_equal '73', "%02d"% @shift.c_shift
    assert_equal '97', "%02d"% @shift.d_shift
  end
end
