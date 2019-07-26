require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/cipher'

class CipherTest < Minitest::Test
  def setup
    @shift = Shift.new
    @key = Key.new
    @offset = Offset.new
    @cipher = Cipher.new

    @key.random_number
    @key.assign_values

    @offset.date_squared
    @offset.last_four
    @offset.assign_offset_values

    @shift.set_a_shift(@key.a_key, @offset.a_offset)
    @shift.set_b_shift(@key.b_key, @offset.b_offset)
    @shift.set_c_shift(@key.c_key, @offset.c_offset)
    @shift.set_d_shift(@key.d_key, @offset.d_offset)
  end
end
