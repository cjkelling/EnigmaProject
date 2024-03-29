require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'

class OffsetTest < Minitest::Test
  def setup
    @offset_1 = Offset.new('110588')
    @offset_2 = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset_1
    assert_instance_of Offset, @offset_2
  end

  def test_date
    expected = Time.now.strftime('%m/%d/%Y').delete('/').to_i
    assert_equal '110588', @offset_1.date
    assert_equal expected, @offset_2.date
  end

  def test_squared
    expected_2 = (@offset_2.date * @offset_2.date)
    assert_equal 12229705744, @offset_1.date_squared
    assert_equal expected_2, @offset_2.date_squared
  end

  def test_last_four
    @offset_1.date_squared
    assert_equal [5, 7, 4, 4], @offset_1.last_four
  end

  def test_assign_offset_values
    @offset_1.date_squared
    @offset_1.last_four
    @offset_1.assign_offset_values
    assert_equal '5', @offset_1.a_offset
    assert_equal '7', @offset_1.b_offset
    assert_equal '4', @offset_1.c_offset
    assert_equal '4', @offset_1.d_offset
  end
end
