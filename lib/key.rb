class Key
  attr_reader :num

  def initialize
    @num = []
  end

  def random_number
    @num << (rand(1..99999))
  end
end
#
# random 5 digit number
# creates a b c d
