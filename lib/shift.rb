class Shift
  attr_reader :a_shift, :b_shift, :c_shift, :d_shift

  def shift(*args)
    @a_shift = (args[0]) + (args[1])
    @b_shift = (args[2]) + (args[3])
    @c_shift = (args[4]) + (args[5])
    @d_shift = (args[6]) + (args[7])
  end
end
