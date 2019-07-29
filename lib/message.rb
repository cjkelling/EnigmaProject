class Message
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

  def new_letters(a_shift, b_shift, c_shift, d_shift)
    shift_a = @character_set.zip(@character_set.rotate(a_shift.to_i)).to_h
    shift_b = @character_set.zip(@character_set.rotate(b_shift.to_i)).to_h
    shift_c = @character_set.zip(@character_set.rotate(c_shift.to_i)).to_h
    shift_d = @character_set.zip(@character_set.rotate(d_shift.to_i)).to_h
    @a_array = @a_array.compact.map { |array| array.chars.map { |ch| shift_a[ch] } }
    @b_array = @b_array.compact.map { |array| array.chars.map { |ch| shift_b[ch] } }
    @c_array = @c_array.compact.map { |array| array.chars.map { |ch| shift_c[ch] } }
    @d_array = @d_array.compact.map { |array| array.chars.map { |ch| shift_d[ch] } }
  end

  def recombine_to_ciphertext
    @ciphertext = @a_array.zip(@b_array).zip(@c_array).zip(@d_array).flatten.join
  end

  def new_letters_reverse(a_shift, b_shift, c_shift, d_shift)
    shift_a = @character_set.zip(@character_set.rotate(-a_shift.to_i)).to_h
    shift_b = @character_set.zip(@character_set.rotate(-b_shift.to_i)).to_h
    shift_c = @character_set.zip(@character_set.rotate(-c_shift.to_i)).to_h
    shift_d = @character_set.zip(@character_set.rotate(-d_shift.to_i)).to_h
    @a_array = @a_array.compact.map { |array| array.chars.map { |ch| shift_a[ch] } }
    @b_array = @b_array.compact.map { |array| array.chars.map { |ch| shift_b[ch] } }
    @c_array = @c_array.compact.map { |array| array.chars.map { |ch| shift_c[ch] } }
    @d_array = @d_array.compact.map { |array| array.chars.map { |ch| shift_d[ch] } }
  end

  def original_message
    @ciphertext
  end
end
