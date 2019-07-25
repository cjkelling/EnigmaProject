require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shift'
require 'date'

class ShiftTest < Minitest::Test
  def setup
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end
end
