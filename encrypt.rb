require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/enigma'

array = File.readlines(ARGV[0]).map(&:chomp)
@words = array[0]
@code = array[1] unless array[1].nil?
@date = array[2] unless array[2].nil?

@key = Key.new(*@code)
@offset = Offset.new(*@date)
@shift = Shift.new
@enigma = Enigma.new

@key.random_number.join
@key.assign_values
@offset.date_squared
@offset.last_four
@offset.assign_offset_values
@shift.shift(
  @key.a_key, @offset.a_offset, @key.b_key, @offset.b_offset,
  @key.c_key, @offset.c_offset, @key.d_key, @offset.d_offset
)

@enigma.split_message(@words)
@enigma.letters_to_cipher(@shift.a_shift, @shift.b_shift, @shift.c_shift, @shift.d_shift)
@enigma.recombine_message
@enigma.encrypt(@enigma, @key.key, @offset.date)

File.open(ARGV[1], 'w') { |encoded| encoded.write(@enigma.recombine_message) }

puts "Created '#{ARGV[1]}' with the key #{@key.num.join} and date #{@offset.date}"
