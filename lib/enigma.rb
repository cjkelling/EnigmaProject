class Enigma
  def encrypt(message, key, date)
    output = {}
    output[:encryption] = message.recombine_to_ciphertext
    output[:key] = key
    output[:date] = date
    output
  end

  def decrypt(message, key, date)
    output = {}
    output[:decryption] = message.original_message
    output[:key] = key
    output[:date] = date
    output
  end
end
