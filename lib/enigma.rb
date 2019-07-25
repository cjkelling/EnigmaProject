# character_set = ("a".."z").to_a << " "
class Enigma
  def encrypt(message, key, date)
    # The encrypt method returns a hash with three keys:
    # :encryption => the encrypted String
    # :key => the key used for encryption as a String
    # :date => the date used for encryption as a String in the form DDMMYY
  end

  def decrypt(ciphertext, key, date)
    # The decrypt method returns a hash with three keys:
    # :decryption => the decrypted String
    # :key => the key used for decryption as a String
    # :date => the date used for decryption as a String in the form DDMMYY
  end
end
