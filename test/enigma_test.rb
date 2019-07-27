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
    @message = Message.new('hello world')
    @key.assign_values
    @offset.date_squared
    @offset.last_four
    @offset.assign_offset_values
    @shift.shift(
      @key.a_key, @offset.a_offset, @key.b_key, @offset.b_offset,
      @key.c_key, @offset.c_offset, @key.d_key, @offset.d_offset
    )
    @message.split_message
    @message.new_letters(@shift.a_shift, @shift.b_shift, @shift.c_shift, @shift.d_shift)
    @message.recombine_to_ciphertext
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_encrypt
    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }
    assert_equal expected, @enigma.encrypt(@message, @key.keys, @offset.date)
  end
  #
  # def test_decrypt
  #   expected = {
  #     encryption: 'hello world',
  #     key: '02715',
  #     date: '040895'
  #   }
  #   assert_equal expected, @enigma.decrypt('keder ohulw', '02715', '040895')
  # end

  # def test_encrypted
  #   encrypted = enigma.encrypt("hello world", "02715")
  #   enigma.decrypt(encrypted[:encryption], "02715")
  #   enigma.encrypt("hello world")
  # end
end
