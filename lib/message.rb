class Message
  attr_reader :message, :character_set, :a_array, :b_array, :c_array, :d_array

  def initialize(message)
    @message = message
    @character_set = ('a'..'z').to_a << ' '
    @a_array = []
    @b_array = []
    @c_array = []
    @d_array = []
  end

  def split_message
    array = @message.downcase.split('')
    array.each_slice(4) do |a, b, c, d|
      @a_array << a
      @b_array << b
      @c_array << c
      @d_array << d
    end
    [@a_array, @b_array, @c_array, @d_array]
  end

  def new_letters(one, two, three, four)
    shift_a = @character_set.zip(@character_set.rotate(one.to_i)).to_h
    shift_b = @character_set.zip(@character_set.rotate(two.to_i)).to_h
    shift_c = @character_set.zip(@character_set.rotate(three.to_i)).to_h
    shift_d = @character_set.zip(@character_set.rotate(four.to_i)).to_h
    @a_array = @a_array.compact.map { |array| array.chars.map { |ch| shift_a[ch] } }
    @b_array = @b_array.compact.map { |array| array.chars.map { |ch| shift_b[ch] } }
    @c_array = @c_array.compact.map { |array| array.chars.map { |ch| shift_c[ch] } }
    @d_array = @d_array.compact.map { |array| array.chars.map { |ch| shift_d[ch] } }
  end
end
