require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/cipher'

class CipherTest < Minitest::Test
  def setup
    @key = Key.new
    @offset = Offset.new(110588)
    @shift = Shift.new
    @cipher = Cipher.new
    @key.random_number
    @key.assign_values
    @offset.date_squared
    @offset.last_four
    @offset.assign_offset_values
    @shift.shift(
      @key.a_key, @offset.a_offset, @key.b_key, @offset.b_offset,
      @key.c_key, @offset.c_offset, @key.d_key, @offset.d_offset
    )
    @cipher.rotate_alphabet_amount(
      @shift.a_shift, @shift.b_shift, @shift.c_shift, @shift.d_shift
    )
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end

  def test_character_set
    expected = ('a'..'z').to_a << ' '
    assert_equal expected, @cipher.character_set
  end

  def test_split_message
    expected = [["h", "o", "r"], ["e", " ", "l"], ["l", "w", "d"], ["l", "o"]]
    assert_equal expected, @cipher.split_message('Hello World')
  end

  def test_rotate
    assert @cipher.a_change.is_a? Numeric
    assert @cipher.b_change.is_a? Numeric
    assert @cipher.c_change.is_a? Numeric
    assert @cipher.d_change.is_a? Numeric
  end

  def test_new_letter
    assert 4, @cipher.new_letters
  end
end
