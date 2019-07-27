class Enigma
  def encrypt(message, key, date)
  output = Hash.new
    output[:encryption] = message.recombine_to_ciphertext
    output[:key] = key
    output[:date] = date
    output
  end

  # def decrypt(ciphertext, key, date)
    # The decrypt method returns a hash with three keys:
    # :decryption => the decrypted String
    # :key => the key used for decryption as a String
    # :date => the date used for decryption as a String in the form DDMMYY
  # end
end
