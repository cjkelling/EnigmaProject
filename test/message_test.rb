require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/message'

class CipherTest < Minitest::Test
  def setup
    @message = Message.new
    @key = Key.new('72693')
    @offset = Offset.new('110588')
    @shift = Shift.new
    @key.assign_values
    @offset.date_squared
    @offset.last_four
    @offset.assign_offset_values
    @shift.shift(
      @key.a_key, @offset.a_offset, @key.b_key, @offset.b_offset,
      @key.c_key, @offset.c_offset, @key.d_key, @offset.d_offset
    )
  end

  def test_it_exists
    assert_instance_of Message, @message
  end

  def test_attributes
    expected = ('a'..'z').to_a << ' '
    assert_equal expected, @message.character_set
    assert_equal [], @message.a_array
    assert_equal [], @message.b_array
    assert_equal [], @message.c_array
    assert_equal [], @message.d_array
  end

  def test_split_message
    expected = [["h", "o", "r"], ["e", " ", "l"], ["l", "w", "d"], ["l", "o", nil]]
    assert_equal expected, @message.split_message('Hello World')
  end

  def test_new_letters
    @message.split_message('Hello World')
    @message.new_letters(@shift.a_shift, @shift.b_shift, @shift.c_shift, @shift.d_shift)
    assert_equal [["d"], ["k"], ["n"]], @message.a_array
    assert_equal [["k"], ["f"], ["r"]], @message.b_array
    assert_equal [["d"], ["o"], ["w"]], @message.c_array
    assert_equal [["a"], ["d"]], @message.d_array
  end

  def test_making_ciphertext
    @message.split_message('Hello World')
    @message.new_letters(@shift.a_shift, @shift.b_shift, @shift.c_shift, @shift.d_shift)
    assert_equal 'dkdakfodnrw', @message.recombine_to_ciphertext
  end

  def test_new_letters_reverse
    @message.split_message('dkdakfodnrw')
    @message.new_letters_reverse(@shift.a_shift, @shift.b_shift, @shift.c_shift, @shift.d_shift)
    assert_equal [["h"], ["o"], ["r"]], @message.a_array
    assert_equal [["e"], [" "], ["l"]], @message.b_array
    assert_equal [["l"], ["w"], ["d"]], @message.c_array
    assert_equal [["l"], ["o"]], @message.d_array
  end

  def test_return_ciphertext_to_original_message
    @message.split_message('dkdakfodnrw')
    @message.new_letters_reverse(@shift.a_shift, @shift.b_shift, @shift.c_shift, @shift.d_shift)
    @message.recombine_to_ciphertext
    assert_equal 'hello world', @message.original_message
  end
end
