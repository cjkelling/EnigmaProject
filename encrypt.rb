require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/message'
require './lib/enigma'

array = File.readlines 'top_secret.txt'
@words = array[0].gsub("\n", '')
@code = array[1].gsub("\n", '')
@date = array[2].gsub("\n", '')

@key = Key.new(@code)
@offset = Offset.new(@date)
@shift = Shift.new
@message = Message.new
@enigma = Enigma.new

@key.assign_values
@offset.date_squared
@offset.last_four
@offset.assign_offset_values
@shift.shift(
  @key.a_key, @offset.a_offset, @key.b_key, @offset.b_offset,
  @key.c_key, @offset.c_offset, @key.d_key, @offset.d_offset
)

@message.split_message(@words)
@message.new_letters(@shift.a_shift, @shift.b_shift, @shift.c_shift, @shift.d_shift)
@message.recombine_to_ciphertext
code = @enigma.encrypt(@message, @key.key, @offset.date)

File.open('encoded.txt', 'w') { |encoded| encoded.write(code) }
