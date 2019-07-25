class Shift
  attr_reader :character_set

  def initialize
    @character_set = ('a'..'z').to_a << ' '
  end

  def set_shifts
    key = Key.new
    offset = Offset.new
    @a_shift = (key.a_key + offset.a_offset)
  end
end
