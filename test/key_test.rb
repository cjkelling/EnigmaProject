require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'

class KeyTest < Minitest::Test
  def setup
    @key_1 = Key.new
    @key_2 = Key.new('02468')
  end

  def test_it_exists
    assert_instance_of Key, @key_1
    assert_instance_of Key, @key_2
  end

  def test_attributes
    assert_equal [], @key_1.num
    assert_equal [], @key_2.num
  end

  def test_5_digit_generation
    assert_equal 5, @key_1.random_number.length
    assert @key_1.random_number[0].is_a? Numeric
    assert @key_1.random_number[4].is_a? Numeric
  end

  def test_assign_values
    @key_1.random_number
    @key_1.assign_values
    assert @key_1.a_key == @key_1.num[0..1].join
    assert @key_1.b_key == @key_1.num[1..2].join
    assert @key_1.c_key == @key_1.num[2..3].join
    assert @key_1.d_key == @key_1.num[3..4].join

    @key_2.assign_values
    assert_equal '02', @key_2.a_key
    assert_equal '24', @key_2.b_key
    assert_equal '46', @key_2.c_key
    assert_equal '68', @key_2.d_key
  end
end
