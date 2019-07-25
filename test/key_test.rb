require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'
require 'date'

class KeyTest < Minitest::Test
  def setup
    @key = Key.new
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_5_digit_generation
    assert @key.random_number.count == 5
  end

  def test_assign_values
    @key.random_number
    @key.assign_values
    assert @key.a_key == @key.num[0..1]
    assert @key.b_key == @key.num[1..2]
    assert @key.c_key == @key.num[2..3]
    assert @key.d_key == @key.num[3..4]
  end
end
