require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/message'

class CipherTest < Minitest::Test
  def setup
    @key = Key.new
    @offset = Offset.new(110588)
    @shift = Shift.new
    @message = Message.new('Hello World')
    @key.random_number
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

  def test_character_set
    expected = ('a'..'z').to_a << ' '
    assert_equal expected, @message.character_set
  end

  def test_split_message
    expected = [["h", "o", "r"], ["e", " ", "l"], ["l", "w", "d"], ["l", "o", nil]]
    assert_equal expected, @message.split_message
  end

  def test_rotate
    @message.rotate_alphabet_amount(
      @shift.a_shift, @shift.b_shift, @shift.c_shift, @shift.d_shift
    )

    assert @message.a_change.is_a? Numeric
    assert @message.b_change.is_a? Numeric
    assert @message.c_change.is_a? Numeric
    assert @message.d_change.is_a? Numeric
  end

  def test_new_letters
    @message.split_message
    @message.rotate_alphabet_amount(
      @shift.a_shift, @shift.b_shift, @shift.c_shift, @shift.d_shift
    )
    assert_equal [['u'], ['x']], @message.new_letters
  end
end
