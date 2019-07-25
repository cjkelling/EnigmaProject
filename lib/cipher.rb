class Cipher
  attr_reader :character_set, :a_change, :b_change, :c_change, :d_change

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

  def rotate_alphabet_amount(*args)
    @a_change = args[0]
    @b_change = args[1]
    @c_change = args[2]
    @d_change = args[3]
  end

  def new_letters
    # p shift_map = @character_set.zip(@character_set.rotate(a_change)).to_h
    # @a_array.each do |array|
    #   a_new << (array.chars.map { |ch| shift_map[ch] })
    # end
    # p a_new
  end
end
