require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/message'
require 'date'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
    @key = Key.new('02715')
    @offset = Offset.new('040895')
    @shift = Shift.new
    @message = Message.new
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

  def test_encrypt
    @message.split_message('Hello World')
    @message.new_letters(@shift.a_shift, @shift.b_shift, @shift.c_shift, @shift.d_shift)
    @message.recombine_to_ciphertext
    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }
    assert_equal expected, @enigma.encrypt(@message, @key.key, @offset.date)
  end

  def test_decrypt
    @message.split_message('keder ohulw')
    @message.new_letters_reverse(@shift.a_shift, @shift.b_shift, @shift.c_shift, @shift.d_shift)
    @message.recombine_to_ciphertext
    expected = {
      decryption: 'hello world',
      key: '02715',
      date: '040895'
    }
    assert_equal expected, @enigma.decrypt(@message, @key.key, @offset.date)
  end
end
