require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'
require 'date'

class OffsetTest < Minitest::Test
  def setup
    @offset = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_date
    expected = Time.now.strftime('%m/%d/%Y').delete('/').to_i
    assert_equal expected, @offset.date
  end

  def test_squared
    expected = (@offset.date * @offset.date)
    assert_equal expected, @offset.date_squared
  end

  def test_last_four
    @offset.date_squared
    assert_equal [6, 3, 6, 1], @offset.last_four
  end

  def test_assign_offset_values
    @offset.date_squared
    @offset.last_four
    @offset.assign_offset_values
    assert @offset.a_offset == @offset.last_four[0]
    assert @offset.b_offset == @offset.last_four[1]
    assert @offset.c_offset == @offset.last_four[2]
    assert @offset.d_offset == @offset.last_four[3]
  end
end
