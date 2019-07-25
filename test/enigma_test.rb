require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require 'date'

class StatTrackerTest < Minitest::Test
  def setup
    @enigma = Enigma.new
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
    assert_equal expected, @enigma.encrypt('hello world', '02715', '040895')
  end

  def test_decrypt
    expected = {
      encryption: 'hello world',
      key: '02715',
      date: '040895'
    }
    assert_equal expected, @enigma.decrypt('keder ohulw', '02715', '040895')
  end

  # def test_encrypted
  #   encrypted = enigma.encrypt("hello world", "02715")
  #   enigma.decrypt(encrypted[:encryption], "02715")
  #   enigma.encrypt("hello world")
  # end
end
