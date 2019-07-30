require './lib/rotate_message'

class Enigma
  include RotateMessage
  attr_reader :message, :character_set, :a_array, :b_array, :c_array, :d_array

  def initialize
    @character_set = ('a'..'z').to_a << ' '
    @a_array = []
    @b_array = []
    @c_array = []
    @d_array = []
  end

  def split_message(message)
    array = message.downcase.split('')
    array.each_slice(4) do |a, b, c, d|
      @a_array << a
      @b_array << b
      @c_array << c
      @d_array << d
    end
    [@a_array, @b_array, @c_array, @d_array]
  end

  def encrypt(message, key, date)
    output = {}
    output[:encryption] = message.recombine_message
    output[:key] = key
    output[:date] = date
    output
  end

  def decrypt(message, key, date)
    output = {}
    output[:decryption] = message.recombine_message
    output[:key] = key
    output[:date] = date
    output
  end
end
