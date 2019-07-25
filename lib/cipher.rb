class Cipher
  attr_reader :character_set

  def initialize
    @character_set = ('a'..'z').to_a << ' '
    @a_array = []
    @b_array = []
    @c_array = []
    @d_array = []
  end

  def split_message(message)
    array = message.to_s.downcase.split('')
    array.each_slice(4) do |a, b, c, d|
      @a_array << a
      @b_array << b
      @c_array << c
      @d_array << d
    end
    [@a_array.compact, @b_array.compact, @c_array.compact, @d_array.compact]
  end
end
