require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shift'
require './lib/key'
require './lib/offset'

class ShiftTest < Minitest::Test
  def setup
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_character_set
    expected = ('a'..'z').to_a << ' '
    assert_equal expected, @shift.character_set
    p @shift.character_set
  end

  def test_set_shifts
    @shift.set_shifts
    assert_equal 2, @shift.a_shift
  end
end
