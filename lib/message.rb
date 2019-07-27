class Message
  attr_reader :message, :character_set, :a_change, :b_change, :c_change,
              :d_change, :a_array, :b_array, :c_array, :d_array

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

  def rotate_alphabet_amount(*args)
    @a_change = args[0]
    @b_change = args[1]
    @c_change = args[2]
    @d_change = args[3]
  end

  def new_letters
    shift_a = @character_set.zip(@character_set.rotate(@a_change)).to_h
    shift_b = @character_set.zip(@character_set.rotate(@b_change)).to_h
    shift_c = @character_set.zip(@character_set.rotate(@c_change)).to_h
    shift_d = @character_set.zip(@character_set.rotate(@d_change)).to_h
    @a_array.compact.map { |array| array.chars.map { |ch| shift_a[ch] } }
    @b_array.compact.map { |array| array.chars.map { |ch| shift_b[ch] } }
    @c_array.compact.map { |array| array.chars.map { |ch| shift_c[ch] } }
    @d_array.compact.map { |array| array.chars.map { |ch| shift_d[ch] } }
  end
end
