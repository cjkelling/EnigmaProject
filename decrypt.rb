require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/enigma'

array = File.readlines(ARGV[0]).map(&:chomp)
@words = array[0]
@code = (ARGV[2])
@date = (ARGV[3])

@key = Key.new(@code)
@offset = Offset.new(@date)
@shift = Shift.new
@enigma = Enigma.new

@key.assign_values
@offset.date_squared
@offset.last_four
@offset.assign_offset_values
@shift.shift(
  @key.a_key, @offset.a_offset, @key.b_key, @offset.b_offset,
  @key.c_key, @offset.c_offset, @key.d_key, @offset.d_offset
)

@enigma.split_message(@words)
@enigma.cipher_to_original(@shift.a_shift, @shift.b_shift, @shift.c_shift, @shift.d_shift)
@enigma.recombine_message
@enigma.encrypt(@enigma, @key.key, @offset.date)

File.open(ARGV[1], 'w') { |encoded| encoded.write(@enigma.recombine_message) }

puts "Created '#{ARGV[1]}' with the key #{@code} and date #{@date}"
