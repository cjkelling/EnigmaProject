class Shift
  attr_reader :a_shift, :b_shift, :c_shift, :d_shift

  def shift(*args)
    @a_shift = ((args[0]).to_i + (args[1]).to_i).to_s
    @b_shift = ((args[2]).to_i + (args[3]).to_i).to_s
    @c_shift = ((args[4]).to_i + (args[5]).to_i).to_s
    @d_shift = ((args[6]).to_i + (args[7]).to_i).to_s
  end
end
