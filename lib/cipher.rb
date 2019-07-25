class Cipher
  attr_reader :character_set

  def initialize
    @character_set = ('a'..'z').to_a << ' '
  end

  def encrypt_alphabet(message)
    message.to_s.downcase.split("")
  end
end
