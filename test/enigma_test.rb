require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/rotate_message'
require 'date'

class EnigmaTest < Minitest::Test
  def setup
    @key = Key.new('72693')
    @offset = Offset.new('110588')
    @shift = Shift.new
    @enigma = Enigma.new
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
    assert_instance_of Enigma, @enigma
  end

  def test_attributes
    expected = ('a'..'z').to_a << ' '
    assert_equal expected, @enigma.character_set
    assert_equal [], @enigma.a_array
    assert_equal [], @enigma.b_array
    assert_equal [], @enigma.c_array
    assert_equal [], @enigma.d_array
  end

  def test_split_message
    expected = [["h", "o", "r"], ["e", " ", "l"], ["l", "w", "d"], ["l", "o", nil]]
    assert_equal expected, @enigma.split_message('Hello World')
  end

  def test_letters_to_cipher
    @enigma.split_message('Hello World')
    @enigma.letters_to_cipher(@shift.a_shift, @shift.b_shift, @shift.c_shift, @shift.d_shift)
    assert_equal [["d"], ["k"], ["n"]], @enigma.a_array
    assert_equal [["k"], ["f"], ["r"]], @enigma.b_array
    assert_equal [["d"], ["o"], ["w"]], @enigma.c_array
    assert_equal [["a"], ["d"]], @enigma.d_array
  end

  def test_making_ciphertext
    @enigma.split_message('Hello World')
    @enigma.letters_to_cipher(@shift.a_shift, @shift.b_shift, @shift.c_shift, @shift.d_shift)
    assert_equal 'dkdakfodnrw', @enigma.recombine_message
  end

  def test_cipher_to_original
    @enigma.split_message('dkdakfodnrw')
    @enigma.cipher_to_original(@shift.a_shift, @shift.b_shift, @shift.c_shift, @shift.d_shift)
    assert_equal [["h"], ["o"], ["r"]], @enigma.a_array
    assert_equal [["e"], [" "], ["l"]], @enigma.b_array
    assert_equal [["l"], ["w"], ["d"]], @enigma.c_array
    assert_equal [["l"], ["o"]], @enigma.d_array
  end

  def test_recombine_message
    @enigma.split_message('dkdakfodnrw')
    @enigma.cipher_to_original(@shift.a_shift, @shift.b_shift, @shift.c_shift, @shift.d_shift)
    assert_equal 'hello world', @enigma.recombine_message
  end

  def test_encrypt
    @enigma.split_message('Hello World')
    @enigma.letters_to_cipher(@shift.a_shift, @shift.b_shift, @shift.c_shift, @shift.d_shift)
    @enigma.recombine_message
    expected = {
      encryption: 'dkdakfodnrw',
      key: '72693',
      date: '110588'
    }
    assert_equal expected, @enigma.encrypt(@enigma, @key.key, @offset.date)
  end

  def test_decrypt
    @enigma.split_message('dkdakfodnrw')
    @enigma.cipher_to_original(@shift.a_shift, @shift.b_shift, @shift.c_shift, @shift.d_shift)
    @enigma.recombine_message
    expected = {
      decryption: 'hello world',
      key: '72693',
      date: '110588'
    }
    assert_equal expected, @enigma.decrypt(@enigma, @key.key, @offset.date)
  end
end
